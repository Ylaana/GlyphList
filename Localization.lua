local _, glyphData = ...

local L = setmetatable({}, { __index = function(t, k)
	local v = tostring(k)
	rawset(t, k, v)
	return v
end })

glyphData.L = L

local LOCALE = GetLocale()

if LOCALE == "enUS" then
	-- The EU English game client also
	-- uses the US English locale code.
return end

if LOCALE == "deDE" then
	-- German translations go here
    L["View all"] = "Alles anzeigen"
return end

if LOCALE == "esES" or LOCALE == "esMX" then
	-- Spanish translations go here
	L["View all"] = "Ver todos"
return end

if LOCALE == "frFR" then
	-- French translations go here
	L["View all"] = "Voir tout"
return end

if LOCALE == "itIT" then
	-- Italian translations go here
	L["View all"] = "Visualizza tutto"
return end

if LOCALE == "ptBR" then
	-- Brazilian Portuguese translations go here
	L["View all"] = "Visualizar tudo"
	-- Note that the EU Portuguese WoW client also
	-- uses the Brazilian Portuguese locale code.
return end

if LOCALE == "ruRU" then
	-- Russian translations go here
	L["View all"] = "Все"
return end

if LOCALE == "koKR" then
	-- Korean translations go here
	L["View all"] = "전체 보기"
return end

if LOCALE == "zhCN" then
	-- Simplified Chinese translations go here
	L["View all"] = "查看所有"
return end

if LOCALE == "zhTW" then
	-- Traditional Chinese translations go here
	L["View all"] = "檢視全部"
return end