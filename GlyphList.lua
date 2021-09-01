local glyphViewer, glyphData = ...

local glyphList = {}
local playerLoc = PlayerLocation:CreateFromUnit("player")
local _, _, playerClassID = C_PlayerInfo.GetClass(playerLoc)
local conflicts = glyphData.Conflicts[playerClassID]
local glyphedSpells = {}
local spec = nil

local function GetGlyphedSpells()
    local spellsWithGlyphs = {}
    for i = 1, GetNumSpellTabs() do
        local _, _, offset, numSlots = GetSpellTabInfo(i)
        for j = offset+1, offset+numSlots do
            local _, spellID = GetSpellBookItemInfo(j, BOOKTYPE_SPELL)
            if HasAttachedGlyph(spellID) then
                spellsWithGlyphs[#spellsWithGlyphs+1] = GetCurrentGlyphNameForSpell(spellID)
            end
        end
    end
    return spellsWithGlyphs
end

local function IsGlyphActive (tab, val)
    if (#tab > 0) then
        for i = 1, #tab do
            if val == tab[i] then
                return true
            end
        end
    end
    return false
end

local function GetCurrentSpec()
    local currentSpec = GetSpecialization()
    if currentSpec then
        local currentSpecId, currentSpecName = GetSpecializationInfo(currentSpec)
        local className = select(7, GetSpecializationInfoByID(currentSpecId))
        return currentSpecName.." "..className
    end
end

function SetTitleText()
    spec = GetCurrentSpec()
    if spec then
        GlyphListFrame.TitleText:SetText("GlyphList - "..spec)
    end
end

local wait = {}
local cache_writer = CreateFrame('Frame')
cache_writer:RegisterEvent("GET_ITEM_INFO_RECEIVED")
cache_writer:RegisterEvent("PLAYER_LOGIN")
cache_writer:SetScript("OnEvent", function(self, event, ...)
    if event == "GET_ITEM_INFO_RECEIVED" then
        local itemID = ...
        if wait[itemID] then
            local itemName, itemLink = GetItemInfo(itemID)
            local isActive = IsGlyphActive(glyphedSpells, itemName)
            glyphList[#glyphList+1] = {
                itemID=itemID,
                itemIcon=GetItemIcon(itemID),
                itemName=itemName,
                itemLink=itemLink,
                isActive=isActive,
            }
            wait[itemID] = nil
        end
    elseif event == "PLAYER_LOGIN" then
        glyphedSpells = GetGlyphedSpells()
        SetTitleText()
    end
end)

local function CreateGlyphList()
    --reset glyph list data!
    glyphList = {}
    for i = 1, #glyphData.Glyphs[playerClassID] do
        local itemID = glyphData.Glyphs[playerClassID][i]
        local itemName, itemLink = GetItemInfo(itemID)
        if itemName then
            local isActive = IsGlyphActive(glyphedSpells, itemName)
            glyphList[#glyphList+1] = {
                itemID=itemID,
                itemIcon=GetItemIcon(itemID),
                itemName=itemName,
                itemLink=itemLink,
                isActive=isActive,
            }
        else
            wait[itemID] = true
        end
    end
    return glyphList
end

local function GetGlyphInfo(itemID)
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
                    local glyph = GetGlyphInfo(matchedSet[k])
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
    self:RegisterEvent("GET_ITEM_INFO_RECEIVED")
    self:RegisterEvent("PLAYER_LOGOUT")

    self.items = CreateGlyphList();

    self.ListScrollFrame.update = function() self:RefreshLayout(); end

    HybridScrollFrame_SetDoNotHideScrollBar(self.ListScrollFrame, true);
end

function GlyphListMixin:OnShow()
    self:RegisterEvent("SPELLS_CHANGED")
    HybridScrollFrame_CreateButtons(self.ListScrollFrame, "GlyphListItemTemplate");
    self:RefreshLayout();
end

function GlyphListMixin:OnHide()
    self:UnregisterEvent("SPELLS_CHANGED")
end

function GlyphListMixin:OnEvent(event, arg1)
    if event == "ADDON_LOADED" and arg1 == "GlyphList" then
        if GlyphListShown == nil then
            GlyphListShown = true
        end
        self:SetShown(GlyphListShown)
    elseif event == "GET_ITEM_INFO_RECEIVED" then
        self:RefreshLayout();
    elseif event == "SPELLS_CHANGED" then
        glyphedSpells = GetGlyphedSpells()
        SetTitleText()
        self.items = CreateGlyphList()
        self:RefreshLayout()
    elseif event == "PLAYER_LOGOUT" then
        GlyphListShown = self:IsShown()
    end
end

function GlyphListMixin:RefreshLayout()
    local items = self.items
    local buttons = HybridScrollFrame_GetButtons(self.ListScrollFrame)
    local offset = HybridScrollFrame_GetOffset(self.ListScrollFrame)

    for buttonIndex = 1, #buttons do
        local button = buttons[buttonIndex]
        local itemIndex = buttonIndex + offset

        button.GlyphActive:Hide()
        button.GlyphConflict:Hide()

        if itemIndex <= #items then
            local item = items[itemIndex]
            local isExclusive, isActive = IsGlyphExclusive(item)
            button:SetID(itemIndex)
            button.Icon:SetTexture(item.itemIcon or nil)
            button.Text:SetText(item.itemLink or "")

            if item.isActive then
                button.GlyphActive:Show()
            elseif isExclusive and isActive then
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