local glyphViewer, glyphData = ...

local glyphList = {}
local playerLoc = PlayerLocation:CreateFromUnit("player")
local _, _, playerClassID = C_PlayerInfo.GetClass(playerLoc)
local playerSpecID = 0
local conflicts = glyphData.Conflicts[playerClassID] or {}
local activeSpells = {}
local glyphedSpells = {}

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
local cache_writer = CreateFrame('Frame')
cache_writer:RegisterEvent("GET_ITEM_INFO_RECEIVED")
cache_writer:SetScript("OnEvent", function(self, event, ...)
    if event == "GET_ITEM_INFO_RECEIVED" then
        local itemID = ...
        if wait[itemID] then
            local itemName, itemLink = GetItemInfo(itemID)
            local glyphID = glyphData.Glyphs[playerClassID][itemID][2]
            local isActive = FindValueInArray(glyphedSpells, glyphID)
            glyphList[#glyphList+1] = {
                itemID=itemID,
                itemIcon=GetItemIcon(itemID),
                itemName=itemName,
                itemLink=itemLink,
                isActive=isActive,
            }
            wait[itemID] = nil
            if next(wait) == nil then
                GlyphListFrame:RefreshLayout()
            end
        end
    end
end)

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
                        local spellLink = GetSpellLink(slotIndex, BOOKTYPE_SPELL)
                        local glyphID = spellLink and tonumber(spellLink:match("%b::(%d+)")) or 0
                        availableSpells[#availableSpells+1] = actionID
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
    --actionID == 0 is only true for druid shapeshift marks
    if (glyphSpecID == 0 or glyphSpecID == playerSpecID) and (isAvailable or actionID == 0) then
        local itemName, itemLink = GetItemInfo(itemID)
        if itemName then
            local isActive = FindValueInArray(glyphedSpells, glyphID)
            local glyphItem = {
                itemID=itemID,
                itemIcon=GetItemIcon(itemID),
                itemName=itemName,
                itemLink=itemLink,
                isActive=isActive,
            }
            return glyphItem
        else
            wait[itemID] = true
        end
    end
end

local function CreateGlyphList()
    --reset glyph list data!
    glyphList = {}

    for itemID, glyphInfo in pairs(glyphData.Glyphs[playerClassID]) do
        if type(glyphInfo[1]) == "table" then
            for _,gInfo in pairs(glyphInfo) do
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
    if (#glyphedSpells > 0 and #conflicts > 0) then
        for i = 1, #conflicts do
            for j = 1, #conflicts[i] do
                if item.itemID == conflicts[i][j] then
                    exclusive = true
                    foundIndex = i
                    break
                end
            end
            if exclusive == true then
                local matchedSet = conflicts[foundIndex]
                for k = 1, #matchedSet do
                    local glyph = GetGlyphMatches(matchedSet[k])
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

GlyphListMixin = {};

function GlyphListMixin:OnLoad()
    -- Set properties
    self:EnableMouse(true)
    self:SetMovable(true)
    self:SetUserPlaced(true)
    self:RegisterForDrag("LeftButton")
    self:RegisterEvent("ADDON_LOADED")
    self:RegisterEvent("SPELLS_CHANGED")
    self:RegisterEvent("PLAYER_LOGIN")
    self:RegisterEvent("GET_ITEM_INFO_RECEIVED")
    self:RegisterEvent("PLAYER_LOGOUT")

    self.items = CreateGlyphList()

    self.ShowAllButton:SetScript("OnClick", function()
        if self.ShowAllButton:GetChecked() then
            ShowAllGlyphs = true
            self.items = CreateGlyphList()
            self:RefreshLayout()
        else
            ShowAllGlyphs = false
            self.items = CreateGlyphList()
            self:RefreshLayout()
        end
    end)

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
        if GlyphListShown == nil then
            GlyphListShown = true
        end
        if ShowAllGlyphs == nil then
            ShowAllGlyphs = false
        end
        self:SetShown(GlyphListShown)
        self.ShowAllButton:SetChecked(ShowAllGlyphs)
    elseif event == "GET_ITEM_INFO_RECEIVED" then
        self:RefreshLayout()
    elseif event == "SPELLS_CHANGED" or event == "PLAYER_LOGIN" then
        activeSpells, glyphedSpells = GetGlyphInfo()
        self:SetTitleText()
        self.items = CreateGlyphList()
        self:RefreshLayout()
    elseif event == "PLAYER_LOGOUT" then
        GlyphListShown = self:IsShown()
        ShowAllGlyphs = self.ShowAllButton:GetChecked()
    end
end

function GlyphListMixin:SetTitleText()
    local specText = GetCurrentSpec()
    if specText then
        self.TitleText:SetText("[GL] "..specText)
        self.TitleText:SetWidth(205)
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
            button.Text:SetWidth(230)

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
SlashCmdList["GlyphList"] = function(msg)
    GlyphListFrame:SetShown(not GlyphListFrame:IsShown())
end