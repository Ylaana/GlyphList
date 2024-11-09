local addonName, addon = ...
local L = addon.L

local GL_NAME = "|cff26cacfGlyphList|r"
local GL_TAB_COUNT = 2;
local GL_TAB_GLYPHS = 1;
local GL_TAB_CLASS = 2;

local glyphList = {}
local classList = {}
local playerLoc = PlayerLocation:CreateFromUnit("player")
local _, _, playerClassID = C_PlayerInfo.GetClass(playerLoc)
local playerSpecID = 0
local isDruid = playerClassID == 11
local isWarlock = playerClassID == 9
local activeSpells = {}
local glyphedSpells = {}
local conflicts = {}
local unlockedItems = {}

local function FindValueInArray(tab, val)
    if (#tab > 0) then
        for i = 1, #tab do
            if val == tab[i] then
                return true
            end
        end
    end
    return false
end

local wait = {}
local wait2 = {}
local cache_writer = CreateFrame("Frame")
cache_writer:RegisterEvent("GET_ITEM_INFO_RECEIVED")
cache_writer:SetScript("OnEvent", function(self, event, ...)
    if event == "GET_ITEM_INFO_RECEIVED" then
        local itemID = ...
        if wait[itemID] or wait2[itemID] then
            local itemName, itemLink = C_Item.GetItemInfo(itemID)
            local isActive

            if wait[itemID] then
                local glyphID = addon.Glyphs[playerClassID][itemID][2]
                isActive = FindValueInArray(glyphedSpells, glyphID)
                glyphList[#glyphList + 1] = {
                    itemID = itemID,
                    itemIcon = C_Item.GetItemIconByID(itemID),
                    itemName = itemName,
                    itemLink = itemLink,
                    isActive = isActive
                }

                wait[itemID] = nil
            elseif wait2[itemID] then
                if isDruid or isWarlock then
                    isActive = unlockedItems[itemID][2]
                    classList[#classList + 1] = {
                        itemID = itemID,
                        itemIcon = C_Item.GetItemIconByID(itemID),
                        itemName = itemName,
                        itemLink = itemLink,
                        isActive = isActive
                    }
                end

                wait2[itemID] = nil
            end

            if next(wait) == nil and next(wait2) == nil then
                if GlyphListFrame:IsShown() then
                    DEFAULT_CHAT_FRAME:AddMessage(GL_NAME .. ": " .. L["REFRESH_MSG"]);
                end
                GlyphListFrame.RefreshButton:Show()
                GlyphListFrame:RefreshLayout()
            end
        end
    end
end)

function GetTableLength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

local function GetCurrentSpec()
    local currentSpec = GetSpecialization()
    if currentSpec then
        local currentSpecID, currentSpecName = GetSpecializationInfo(currentSpec)
        playerSpecID = currentSpecID
        local className = select(7, GetSpecializationInfoByID(currentSpecID))
        return currentSpecName .. " " .. className
    end
end

local function GetGlyphInfo()
    local appliedGlyphs = {}
    local availableSpells = {}

    for i = 2, C_SpellBook.GetNumSpellBookSkillLines() do
        local skillLineInfo = C_SpellBook.GetSpellBookSkillLineInfo(i)
        local offset, numSlots, offSpecID = skillLineInfo.itemIndexOffset, skillLineInfo.numSpellBookItems, skillLineInfo.offSpecID
        --only get class tab and active/first spec tab
        if offSpecID == nil or offSpecID == playerSpecID then
            for j = offset + 1, offset + numSlots do
                local itemType, actionID = C_SpellBook.GetSpellBookItemType(j, Enum.SpellBookSpellBank.Player)
                if itemType == Enum.SpellBookItemType.Flyout then
                    local _, _, numSpells = GetFlyoutInfo(actionID)
                    for spellIndex = 1, numSpells do
                        local flyoutSpellID = GetFlyoutSlotInfo(actionID, spellIndex)
                        if IsSpellKnown(flyoutSpellID) then
                            local spellLink = C_Spell.GetSpellLink(flyoutSpellID)
                            local glyphID = spellLink and tonumber(spellLink:match("%b::(%d+)")) or 0
                            availableSpells[#availableSpells + 1] = flyoutSpellID
                            if glyphID ~= 0 then
                                appliedGlyphs[#appliedGlyphs + 1] = glyphID
                            end
                        end
                    end
                else
                    if IsSpellKnown(actionID) then
                        local spellLink
                        --exception for icy veins which now summons water elemental
                        if playerClassID == 8 and actionID == 12472 then
                            --spell ID for summon water elemental (not in spellbook)
                            local spellID = 31687
                            spellLink = C_Spell.GetSpellLink(spellID)
                            availableSpells[#availableSpells + 1] = spellID
                        else
                            spellLink = C_SpellBook.GetSpellBookItemLink(j, Enum.SpellBookSpellBank.Player)
                            availableSpells[#availableSpells + 1] = actionID
                        end

                        local glyphID = spellLink and tonumber(spellLink:match("%b::(%d+)")) or 0
                        if glyphID ~= 0 then
                            appliedGlyphs[#appliedGlyphs + 1] = glyphID
                        end
                    end
                end
            end
        end
    end
    return availableSpells, appliedGlyphs
end

local function GetCompletedQuests(questData)
    local quests = {}
    for itemID, questInfo in pairs(questData) do
        local questID = questInfo[1]
        local spellID = questInfo[2]
        local completed = C_QuestLog.IsQuestFlaggedCompletedOnAccount(questID)
        quests[itemID] = { questID, completed, spellID }
    end
    return quests
end

local function GetConflicts()
    local conf = {}
    if (addon.Glyphs[playerClassID] == nil) then return conf end

    --build conflicts list
    for itemID, glyphInfo in pairs(addon.Glyphs[playerClassID]) do
        if type(glyphInfo[1]) == "table" then
            for _, gInfo in pairs(glyphInfo) do
                local actionID = gInfo[3]
                if not conf[actionID] then
                    conf[actionID] = {}
                end

                table.insert(conf[actionID], itemID)
            end
        else
            local actionID = glyphInfo[3]
            if not conf[actionID] then
                conf[actionID] = {}
            end

            table.insert(conf[actionID], itemID)
        end
    end

    --remove any 'standalone' glyphs
    for k, v in pairs(conf) do
        if #v == 1 then
            conf[k] = nil
        end
    end

    return conf
end

local function BuildClassData(itemID, classInfo)
    -- quest/achievement ID = classInfo[1]
    local completed = classInfo[2]

    local itemName, itemLink = C_Item.GetItemInfo(itemID)
    if itemName then
        local isActive = completed
        local classItem = {
            itemID = itemID,
            itemIcon = C_Item.GetItemIconByID(itemID),
            itemName = itemName,
            itemLink = itemLink,
            isActive = isActive
        }
        return classItem
    else
        wait2[itemID] = true
    end
end

local function BuildGlyphData(itemID, glyphInfo)
    local glyphSpecID = glyphInfo[1]
    local glyphID = glyphInfo[2]
    local actionID = glyphInfo[3]
    local isAvailable

    if ShowAllGlyphs == true then
        isAvailable = true
    else
        isAvailable = FindValueInArray(activeSpells, actionID)
    end

    --glyphSpecID == 0 if the glyph can be used by all specs
    if (glyphSpecID == 0 or glyphSpecID == playerSpecID) and isAvailable then
        local itemName, itemLink = C_Item.GetItemInfo(itemID)
        if itemName then
            local isActive = FindValueInArray(glyphedSpells, glyphID)
            local glyphItem = {
                itemID = itemID,
                itemIcon = C_Item.GetItemIconByID(itemID),
                itemName = itemName,
                itemLink = itemLink,
                isActive = isActive
            }
            return glyphItem
        else
            wait[itemID] = true
        end
    end
end

local function CreateClassList(classData)
    classList = {}
    for itemID, classInfo in pairs(classData) do
        if type(classInfo[1]) == "table" then
            for _, cInfo in pairs(classInfo) do
                local data = BuildClassData(itemID, cInfo)
                if data ~= nil then
                    classList[#classList + 1] = data
                end
            end
        else
            local data = BuildClassData(itemID, classInfo)
            if data ~= nil then
                classList[#classList + 1] = data
            end
        end
    end
    return classList
end

local function CreateGlyphList()
    glyphList = {}
    if (addon.Glyphs[playerClassID] == nil) then return glyphList end

    for itemID, glyphInfo in pairs(addon.Glyphs[playerClassID]) do
        if type(glyphInfo[1]) == "table" then
            for _, gInfo in pairs(glyphInfo) do
                local data = BuildGlyphData(itemID, gInfo)
                if data ~= nil then
                    glyphList[#glyphList + 1] = data
                end
            end
        else
            local data = BuildGlyphData(itemID, glyphInfo)
            if data ~= nil then
                glyphList[#glyphList + 1] = data
            end
        end
    end
    return glyphList
end

local function GetGlyphMatches(itemID)
    for i = 1, #glyphList do
        if itemID == glyphList[i].itemID then
            return glyphList[i]
        end
    end
end

local function IsUnlock(spellID)
    for _, v in pairs(unlockedItems) do
        if spellID == v[3] then
            return true
        end
    end
    return false
end

local function IsGlyphExclusive(item)
    local exclusive = false
    local active = false
    local foundIndex = 0
    local conflictsCount = GetTableLength(conflicts)

    if (#glyphedSpells > 0 and conflictsCount > 0) then
        for k, v in pairs(conflicts) do
            for _, glyphID in pairs(v) do
                if item.itemID == glyphID then
                    exclusive = true
                    foundIndex = k
                    break
                end
            end
            if exclusive == true then
                local matchedSet = conflicts[foundIndex]
                for i = 1, #matchedSet do
                    local glyph = GetGlyphMatches(matchedSet[i])
                    if glyph and glyph.isActive then
                        active = true
                        break
                    end
                end
            end
        end
    end
    return exclusive, active
end

function RefreshButton_OnClick(self, button)
    local tab = PanelTemplates_GetSelectedTab(GlyphListFrame)
    GlyphListFrame:ChangeTab(tab)
    self:Hide()
end

GlyphListMixin = {};

function GlyphListMixin:OnLoad()
    if isDruid or isWarlock then
        PanelTemplates_SetNumTabs(self, GL_TAB_COUNT);

        if isDruid then
            self.GlyphListFrameTab2.Text:SetText(L["MARKS"])
        elseif isWarlock then
            self.GlyphListFrameTab2.Text:SetText(L["GRIMOIRES"])
        end
        self.GlyphListFrameTab2:Show()
    else
        --hide class tab
        PanelTemplates_SetNumTabs(self, 1);
    end

    PanelTemplates_SetTab(self, GL_TAB_GLYPHS);

    self:EnableMouse(true)
    self:SetMovable(true)
    self:SetUserPlaced(true)
    self:RegisterForDrag("LeftButton")
    self:RegisterEvent("ADDON_LOADED")
    self:RegisterEvent("SPELLS_CHANGED")
    self:RegisterEvent("PLAYER_LOGIN")
    self:RegisterEvent("GET_ITEM_INFO_RECEIVED")
    if isDruid or isWarlock then
        self:RegisterEvent("RECEIVED_ACHIEVEMENT_LIST")
        self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    end
    self:RegisterEvent("PLAYER_LOGOUT")

    local viewAll = self.ViewAllButton
    viewAll.Text:SetText(L["VIEW_ALL"])
    viewAll.Text:SetFontObject("GameFontNormalSmall")
    viewAll.Text:SetPoint("LEFT", -7, 0);
    viewAll.Checkbox:SetSize(20, 19)
    viewAll.Checkbox:SetPoint("LEFT", -33, 0)
    local viewAllWidth = viewAll.Text:GetWidth() + 5
    viewAll:SetWidth(viewAllWidth)
    viewAll:SetPoint("TOPLEFT", self, "TOPRIGHT", viewAllWidth * -1, -24)

    viewAll.Checkbox:SetScript("OnClick", function()
        if viewAll.Checkbox:GetChecked() then
            ShowAllGlyphs = true
        else
            ShowAllGlyphs = false
        end
        self.items = CreateGlyphList()
        self:RefreshLayout()
    end)

    self.items = CreateGlyphList()
    self.ListScrollFrame.update = function() self:RefreshLayout() end

    HybridScrollFrame_SetDoNotHideScrollBar(self.ListScrollFrame, true)
end

function GlyphListMixin:OnShow()
    HybridScrollFrame_CreateButtons(self.ListScrollFrame, "GlyphListItemTemplate")
    self:RefreshLayout()
end

function GlyphListMixin:OnHide()
end

function GlyphListMixin:OnEvent(event, ...)
    local arg1, arg2, arg3 = ...
    if event == "ADDON_LOADED" and arg1 == "GlyphList" then
        if AddonShown == nil then
            AddonShown = true
        end
        if ShowAllGlyphs == nil then
            ShowAllGlyphs = false
        end
        self:SetShown(AddonShown)
        self.ViewAllButton.Checkbox:SetChecked(ShowAllGlyphs)
    elseif event == "GET_ITEM_INFO_RECEIVED" then
        self:RefreshLayout()
    elseif event == "UNIT_SPELLCAST_SUCCEEDED" and arg1 == "player" then
        if IsUnlock(arg3) then
            unlockedItems = GetCompletedQuests(addon.Barbershop[playerClassID])
            self:ChangeTab(GL_TAB_CLASS)
        end
    elseif event == "RECEIVED_ACHIEVEMENT_LIST" then
        unlockedItems = GetCompletedQuests(addon.Barbershop[playerClassID])
        self:ChangeTab(GL_TAB_CLASS)
    elseif event == "PLAYER_LOGIN" then
        local next = next
        if isDruid then
            if Druid == nil or next(Druid) == nil then
                unlockedItems = GetCompletedQuests(addon.Barbershop[playerClassID])
            else
                unlockedItems = Druid
            end
            self.GlyphListFrameTab2.Text:SetText(L["MARKS"])
            self.GlyphListFrameTab2:Show()
            PanelTemplates_SetNumTabs(self, 2);
        elseif isWarlock then
            if Warlock == nil or next(Warlock) == nil then
                unlockedItems = GetCompletedQuests(addon.Barbershop[playerClassID])
            else
                unlockedItems = Warlock
            end
            self.GlyphListFrameTab2.Text:SetText(L["GRIMOIRES"])
            self.GlyphListFrameTab2:Show()
            PanelTemplates_SetNumTabs(self, 2);
        end

        activeSpells, glyphedSpells = GetGlyphInfo()
        conflicts = GetConflicts()
        self:SetTitleText()
        self:ChangeTab(GL_TAB_GLYPHS)
    elseif event == "SPELLS_CHANGED" then
        activeSpells, glyphedSpells = GetGlyphInfo()
        conflicts = GetConflicts()
        self:SetTitleText()
        self:ChangeTab(GL_TAB_GLYPHS)
    elseif event == "PLAYER_LOGOUT" then
        AddonShown = self:IsShown()
        ShowAllGlyphs = self.ViewAllButton.Checkbox:GetChecked()
        if isDruid then
            Druid = unlockedItems
        elseif isWarlock then
            Warlock = unlockedItems
        end
    end
end

function GlyphListMixin:SelectTab(tab)
    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
    local tabID = tab:GetID()
    self:ChangeTab(tabID);
end

function GlyphListMixin:ChangeTab(tabID)
    PanelTemplates_SetTab(self, tabID);
    if tabID == GL_TAB_GLYPHS then
        self:ShowGlyphList();
    elseif tabID == GL_TAB_CLASS then
        self:ShowClassList();
    end
end

function GlyphListMixin:ShowGlyphList()
    self.ViewAllButton:Show()
    self.items = CreateGlyphList()
    self:RefreshLayout()
end

function GlyphListMixin:ShowClassList()
    self.ViewAllButton:Hide()
    self.items = CreateClassList(unlockedItems)
    self:RefreshLayout()
end

function GlyphListMixin:SetTitleText()
    local specText = GetCurrentSpec()
    if specText then
        self:SetTitle(specText)
    end
end

function GlyphListMixin:RefreshLayout()
    local items = self.items
    local buttons = HybridScrollFrame_GetButtons(self.ListScrollFrame)
    local offset = HybridScrollFrame_GetOffset(self.ListScrollFrame)

    for buttonIndex = 1, #buttons do
        local button = buttons[buttonIndex]
        local itemIndex = buttonIndex + offset

        button.IconActive:Hide()
        button.GlyphActive:Hide()
        button.IconConflict:Hide()
        button.GlyphConflict:Hide()

        if itemIndex <= #items then
            local item = items[itemIndex]
            local isExclusive, isActive = IsGlyphExclusive(item)
            button:SetID(itemIndex)
            button.Icon:SetTexture(item.itemIcon or nil)
            button.Text:SetText(item.itemLink or "")
            button.Text:SetWidth(240)

            if item.isActive then
                button.Icon:SetTexture(nil)
                button.IconActive:Show()
                button.GlyphActive:Show()
            elseif isExclusive and isActive then
                button.Icon:SetTexture(nil)
                button.IconConflict:Show()
                button.GlyphConflict:Show()
            end

            button:SetScript("OnEnter", function()
                GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
                GameTooltip:SetHyperlink(item.itemLink)
                GameTooltip:Show()
            end)
            button:SetScript("OnLeave", function()
                GameTooltip:Hide()
            end)
            button:SetScript("OnClick", function(self, btn)
                if btn == "LeftButton" and IsShiftKeyDown() then
                    ChatEdit_InsertLink(item.itemLink)
                end
            end)

            button:SetWidth(self.ListScrollFrame.scrollChild:GetWidth())
            button:Show()
        else
            button:Hide()
        end
    end

    local buttonHeight = self.ListScrollFrame.buttonHeight
    local totalHeight = #items * buttonHeight
    local shownHeight = #buttons * buttonHeight

    HybridScrollFrame_Update(self.ListScrollFrame, totalHeight, shownHeight)
end

_G["SLASH_GlyphList1"] = "/gl"
_G["SLASH_GlyphList2"] = "/glyphlist"
local function handler(msg, editBox)
    if msg == "" then
        GlyphListFrame:SetShown(not GlyphListFrame:IsShown())
    elseif msg == "show" then
        GlyphListFrame:SetShown(true)
    elseif msg == "hide" then
        GlyphListFrame:SetShown(false)
    elseif msg == "refresh" then
        GlyphListFrame:ChangeTab(GL_TAB_GLYPHS)
        if isDruid or isWarlock then
            unlockedItems = GetCompletedQuests(addon.Barbershop[playerClassID])
        end
    end
end
SlashCmdList["GlyphList"] = handler
