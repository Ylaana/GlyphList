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
	L["VIEW_ALL"] = "View all"
	L["SHOW_MARKS"] = "Show Barber Shop shapeshift form customizations (Druid only)"
return end

if LOCALE == "deDE" then
	-- German translations go here
	L["VIEW_ALL"] = "Alles anzeigen"
	L["SHOW_MARKS"] = "Show Barber Shop shapeshift form customizations (Druid only)"
return end

if LOCALE == "esES" or LOCALE == "esMX" then
	-- Spanish translations go here
	L["VIEW_ALL"] = "Ver todos"
	L["SHOW_MARKS"] = "Show Barber Shop shapeshift form customizations (Druid only)"
return end

if LOCALE == "frFR" then
	-- French translations go here
	L["VIEW_ALL"] = "Voir tout"
	L["SHOW_MARKS"] = "Show Barber Shop shapeshift form customizations (Druid only)"
return end

if LOCALE == "itIT" then
	-- Italian translations go here
	L["VIEW_ALL"] = "Visualizza tutto"
	L["SHOW_MARKS"] = "Show Barber Shop shapeshift form customizations (Druid only)"
return end

if LOCALE == "ptBR" then
	-- Brazilian Portuguese translations go here
	-- Note that the EU Portuguese WoW client also
	-- uses the Brazilian Portuguese locale code.
	L["VIEW_ALL"] = "Visualizar tudo"
	L["SHOW_MARKS"] = "Show Barber Shop shapeshift form customizations (Druid only)"
return end

if LOCALE == "ruRU" then
	-- Russian translations go here
	L["VIEW_ALL"] = "Посмотреть все"
	L["SHOW_MARKS"] = "Показать настройки и изменение формы в парикмахерской (только для друидов)"
return end

if LOCALE == "koKR" then
	-- Korean translations go here
	L["VIEW_ALL"] = "전체 보기"
	L["SHOW_MARKS"] = "Show Barber Shop shapeshift form customizations (Druid only)"
return end

if LOCALE == "zhCN" then
	-- Simplified Chinese translations go here
	L["VIEW_ALL"] = "查看所有"
	L["SHOW_MARKS"] = "Show Barber Shop shapeshift form customizations (Druid only)"
return end

if LOCALE == "zhTW" then
	-- Traditional Chinese translations go here
	L["VIEW_ALL"] = "檢視全部"
	L["SHOW_MARKS"] = "Show Barber Shop shapeshift form customizations (Druid only)"
return end