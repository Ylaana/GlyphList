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
	--L["GLYPHS"] = "Glyphs"
	L["MARKS"] = "Marks"
	L["VIEW_ALL"] = "View all"
	L["GLYPHS_LOADED"] = "Finished loading Glyphs, please click Refresh"
	L["MARKS_LOADED"] = "Finished loading Marks, please click Refresh"
return end

if LOCALE == "deDE" then
	-- German translations go here
	--L["GLYPHS"] = "Glyphen"
	L["MARKS"] = "Male"
	L["VIEW_ALL"] = "Alles anzeigen"
	L["GLYPHS_LOADED"] = "Glyphen fertig geladen, bitte Aktualisieren"
	L["MARKS_LOADED"] = "Male fertig geladen, bitte Aktualisieren"
return end

if LOCALE == "esES" or LOCALE == "esMX" then
	-- Spanish translations go here
	--L["GLYPHS"] = "Glifos"
	L["MARKS"] = "Marcas"
	L["VIEW_ALL"] = "Ver todos"
	L["GLYPHS_LOADED"] = "Se han terminado de cargar los Glifos, por favor, pulse Actualizar"
	L["MARKS_LOADED"] = "Se han terminado de cargar las Marcas, por favor, pulse Actualizar"
return end

if LOCALE == "frFR" then
	-- French translations go here
	--L["GLYPHS"] = "Glyphes"
	L["MARKS"] = "Marques"
	L["VIEW_ALL"] = "Voir tout"
	L["GLYPHS_LOADED"] = "Chargement des Glyphes terminé, veuillez Actualiser"
	L["MARKS_LOADED"] = "Chargement des Marques terminé, veuillez Actualiser"
return end

if LOCALE == "itIT" then
	-- Italian translations go here
	--L["GLYPHS"] = "Glifi"
	L["MARKS"] = "Marchi"
	L["VIEW_ALL"] = "Visualizza tutto"
	L["GLYPHS_LOADED"] = "Caricamento dei Glifi terminato, fare clic su Aggiorna"
	L["MARKS_LOADED"] = "Caricamento dei Marchi terminato, fare clic su Aggiorna"
return end

if LOCALE == "ptBR" then
	-- Brazilian Portuguese translations go here
	-- Note that the EU Portuguese WoW client also
	-- uses the Brazilian Portuguese locale code.
	--L["GLYPHS"] = "Glifos"
	L["MARKS"] = "Marcas"
	L["VIEW_ALL"] = "Visualizar tudo"
	L["GLYPHS_LOADED"] = "Carregamento de Glifos concluído, por favor clique Atualizar"
	L["MARKS_LOADED"] = "Carregamento de Marcas concluído, por favor clique Atualizar"
return end

if LOCALE == "ruRU" then
	-- Russian translations go here
	--L["GLYPHS"] = "Символы"
	L["MARKS"] = "Метки"
	L["VIEW_ALL"] = "Посмотреть все"
	L["GLYPHS_LOADED"] = "Завершена загрузка Символов, пожалуйста, нажмите Обновить"
	L["MARKS_LOADED"] = "Завершена загрузка Меток, пожалуйста, нажмите Обновить"
return end

if LOCALE == "koKR" then
	-- Korean translations go here
	L["GLYPHS"] = "문양들"
	L["MARKS"] = "징표들"
	L["VIEW_ALL"] = "전체 보기"
	L["GLYPHS_LOADED"] = "문양들 로드를 마쳤습니다. 새로 고침을 클릭하십시오."
	L["MARKS_LOADED"] = "징표들 로드를 마쳤습니다. 새로 고침을 클릭하십시오."
return end

if LOCALE == "zhCN" then
	-- Simplified Chinese translations go here
	--L["GLYPHS"] = "雕文"
	L["MARKS"] = "印记"
	L["VIEW_ALL"] = "查看所有"
	L["GLYPHS_LOADED"] = "已完成雕纹加载，请点击刷新键"
	L["MARKS_LOADED"] = "已完成印记加载，请点击刷新键"
return end

if LOCALE == "zhTW" then
	-- Traditional Chinese translations go here
	--L["GLYPHS"] = "雕文"
	L["MARKS"] = "印記"
	L["VIEW_ALL"] = "檢視全部"
	L["GLYPHS_LOADED"] = "已完成雕紋加載，請點擊刷新鍵"
	L["MARKS_LOADED"] = "已完成印記加載，請點擊刷新鍵"
return end