local _, glyphData = ...
local L = glyphData.L

local GL_NAME = "|cff26cacfGlyphList|r"
local GL_TAB_COUNT = 2;
local GL_TAB_GLYPHS = 1;
local GL_TAB_MARKS = 2;

local glyphList = {}
local marksList = {}
local playerLoc = PlayerLocation:CreateFromUnit("player")
local _, _, playerClassID = C_PlayerInfo.GetClass(playerLoc)
local playerSpecID = 0
local activeSpells = {}
local glyphedSpells = {}
local conflicts = {}
local druidForms = {}
local isDruid = playerClassID == 11


local function FindValueInArray (tab, val)
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
local cache_writer = CreateFrame("Frame")
cache_writer:RegisterEvent("GET_ITEM_INFO_RECEIVED")
cache_writer:SetScript("OnEvent", function(self, event, ...)
    if event == "GET_ITEM_INFO_RECEIVED" then
        local itemID = ...
        if wait[itemID] then
            local itemName, itemLink = GetItemInfo(itemID)
            local isActive
            if PanelTemplates_GetSelectedTab(GlyphListFrame) == GL_TAB_MARKS then
                isActive = druidForms[itemID][2]
            else
                local glyphID = glyphData.Glyphs[playerClassID][itemID][2]
                isActive = FindValueInArray(glyphedSpells, glyphID)
            end

            glyphList[#glyphList+1] = {
                itemID=itemID,
                itemIcon=GetItemIcon(itemID),
                itemName=itemName,
                itemLink=itemLink,
                isActive=isActive
            }
            wait[itemID] = nil
            if next(wait) == nil then
                if PanelTemplates_GetSelectedTab(GlyphListFrame) == GL_TAB_GLYPHS then
                    DEFAULT_CHAT_FRAME:AddMessage(GL_NAME..": "..L["GLYPHS_LOADED"]);
                else
                    DEFAULT_CHAT_FRAME:AddMessage(GL_NAME..": "..L["MARKS_LOADED"]);
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
        return currentSpecName.." "..className
    end
end

local function GetGlyphInfo()
    local appliedGlyphs = {}
    local availableSpells = {}

    for tabIndex = 2, GetNumSpellTabs() do
        local _, _, offset, numSlots, _, offspecID = GetSpellTabInfo(tabIndex)
        --only get class tab and active/first spec tab
        if offspecID == 0 or offspecID == playerSpecID then
            for slotIndex = offset+1, offset+numSlots do
                local slotType, actionID = GetSpellBookItemInfo(slotIndex, BOOKTYPE_SPELL)
                if slotType == "FLYOUT" then
                    local _, _, numSpells = GetFlyoutInfo(actionID)
                    for spellIndex = 1, numSpells do
                        local flyoutSpellID = GetFlyoutSlotInfo(actionID, spellIndex)
                        if IsSpellKnown(flyoutSpellID) then
                            local spellLink = GetSpellLink(flyoutSpellID)
                            local glyphID = spellLink and tonumber(spellLink:match("%b::(%d+)")) or 0
                            availableSpells[#availableSpells+1] = flyoutSpellID
                            if glyphID ~= 0 then
                                appliedGlyphs[#appliedGlyphs+1] = glyphID
                            end
                        end
                    end
                else
                    if IsSpellKnown(actionID) then
                        local spellLink
                        --exception for icy veins which now triggers the summon water elemental spell
                        if playerClassID == 8 and actionID == 12472 then
                            --spell ID for summon water elemental (not in spellbook)
                            local spellID = 31687
                            spellLink = GetSpellLink(spellID)
                            availableSpells[#availableSpells+1] = spellID
                        else
                            spellLink = GetSpellLink(slotIndex, BOOKTYPE_SPELL)
                            availableSpells[#availableSpells+1] = actionID
                        end

                        local glyphID = spellLink and tonumber(spellLink:match("%b::(%d+)")) or 0
                        if glyphID ~= 0 then
                            appliedGlyphs[#appliedGlyphs+1] = glyphID
                        end
                    end
                end
            end
        end
    end
    return availableSpells, appliedGlyphs
end

local function GetDruidForms()
    druidForms = {}

    for itemID, achievementID in pairs (glyphData.Marks) do
        local completed = select(4, GetAchievementInfo(achievementID))
        druidForms[itemID] = { achievementID, completed }
    end
    return druidForms
end

local function GetConflicts()
    local conf = {}

    --build conflicts list
    for itemID, glyphInfo in pairs(glyphData.Glyphs[playerClassID]) do
        if type(glyphInfo[1]) == "table" then
            for _,gInfo in pairs(glyphInfo) do
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

local function BuildMarksData(itemID, markInfo)
    -- local achievementID = markInfo[1]
    local completed = markInfo[2]

    --print("getting marks data: "..itemID..", "..dump(markInfo))
    local itemName, itemLink = GetItemInfo(itemID)
    if itemName then
        local isActive = completed
        local markItem = {
            itemID=itemID,
            itemIcon=GetItemIcon(itemID),
            itemName=itemName,
            itemLink=itemLink,
            isActive=isActive
        }
        return markItem
    else
        wait[itemID] = true
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
        local itemName, itemLink = GetItemInfo(itemID)
        if itemName then
            local isActive = FindValueInArray(glyphedSpells, glyphID)
            local glyphItem = {
                itemID=itemID,
                itemIcon=GetItemIcon(itemID),
                itemName=itemName,
                itemLink=itemLink,
                isActive=isActive
            }
            return glyphItem
        else
            wait[itemID] = true
        end
    end
end

local function CreateMarksList()
    marksList = {}

    for itemID, markInfo in pairs (druidForms) do
        local data = BuildMarksData(itemID, markInfo)
        if data ~= nil then
            marksList[#marksList+1] = data
        end
    end
    return marksList
end

local function CreateGlyphList()
    glyphList = {}

    for itemID, glyphInfo in pairs(glyphData.Glyphs[playerClassID]) do
        if type(glyphInfo[1]) == "table" then
            for _, gInfo in pairs(glyphInfo) do
                local data = BuildGlyphData(itemID, gInfo)
                if data ~= nil then
                    glyphList[#glyphList+1] = data
                end
            end
        else
            local data = BuildGlyphData(itemID, glyphInfo)
            if data ~= nil then
                glyphList[#glyphList+1] = data
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
    self:EnableMouse(true)
    self:SetMovable(true)
    self:SetUserPlaced(true)
    self:RegisterForDrag("LeftButton")
    self:RegisterEvent("ADDON_LOADED")
    self:RegisterEvent("SPELLS_CHANGED")
    self:RegisterEvent("PLAYER_LOGIN")
    self:RegisterEvent("GET_ITEM_INFO_RECEIVED")
    if isDruid then
        self:RegisterEvent("RECEIVED_ACHIEVEMENT_LIST")
    end
    self:RegisterEvent("PLAYER_LOGOUT")

    self.ViewAllButton.Text:SetText(L["VIEW_ALL"])
    self.ViewAllButton.Text:SetFontObject("GameFontNormalSmall")
    self.ViewAllButton.CheckBox:SetSize(20,19)
    self.ViewAllButton.CheckBox:SetPoint("LEFT",-24,0)
    local viewAllWidth = (self.ViewAllButton.Text:GetWidth() + 10)
    self.ViewAllButton:SetPoint("TOPLEFT", self, "TOPRIGHT", viewAllWidth * -1, -22)

    self.ViewAllButton.CheckBox:SetScript("OnClick", function()
        if self.ViewAllButton.CheckBox:GetChecked() then
            ShowAllGlyphs = true
            self.items = CreateGlyphList()
            self:RefreshLayout()
        else
            ShowAllGlyphs = false
            self.items = CreateGlyphList()
            self:RefreshLayout()
        end
    end)

    if isDruid then
        self.GlyphListFrameTab2:Show()
        PanelTemplates_SetNumTabs(self, GL_TAB_COUNT);
        self.GlyphListFrameTab2.Text:SetText(L["MARKS"])
    else
        --hide Marks tab for non-druids
        self.GlyphListFrameTab2:Hide()
        PanelTemplates_SetNumTabs(self, 1);
    end

    PanelTemplates_SetTab(self, GL_TAB_GLYPHS);

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

function GlyphListMixin:OnEvent(event, arg1)
    if event == "ADDON_LOADED" and arg1 == "GlyphList" then
        if AddonShown == nil then
            AddonShown = true
        end
        if ShowAllGlyphs == nil then
            ShowAllGlyphs = false
        end
        self:SetShown(AddonShown)
        self.ViewAllButton.CheckBox:SetChecked(ShowAllGlyphs)
    elseif event == "GET_ITEM_INFO_RECEIVED" then
        self:RefreshLayout()
    elseif event == "RECEIVED_ACHIEVEMENT_LIST" and isDruid then
        self:ChangeTab(GL_TAB_MARKS)
        druidForms = GetDruidForms()
    elseif event == "PLAYER_LOGIN" and isDruid then
        if DruidForms == nil then
            druidForms = GetDruidForms()
        else
            druidForms = DruidForms
        end
    elseif event == "SPELLS_CHANGED" or event == "PLAYER_LOGIN" then
        activeSpells, glyphedSpells = GetGlyphInfo()
        conflicts = GetConflicts()
        self:ChangeTab(GL_TAB_GLYPHS)
        self:SetTitleText()
        self.items = CreateGlyphList()
        self:RefreshLayout()
    elseif event == "PLAYER_LOGOUT" then
        AddonShown = self:IsShown()
        ShowAllGlyphs = self.ViewAllButton.CheckBox:GetChecked()
        if isDruid then
            DruidForms = druidForms
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
	if tabID == 1 then
		self:ShowGlyphList();
	elseif tabID == 2 then
		self:ShowMarksList();
	end
end

function GlyphListMixin:ShowGlyphList()
    self.ViewAllButton:Show()
    self.items = CreateGlyphList()
    self:RefreshLayout()
end

function GlyphListMixin:ShowMarksList()
    self.ViewAllButton:Hide()
    self.items = CreateMarksList()
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
    elseif msg == "forceupdate" then
        GlyphListFrame:ChangeTab(GL_TAB_GLYPHS)
        if isDruid then
            druidForms = GetDruidForms()
        end
    end
end
SlashCmdList["GlyphList"] = handler
