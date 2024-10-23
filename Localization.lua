local addonName, addon = ...

local L = setmetatable({}, {
    __index = function(t, k)
        local v = tostring(k)
        rawset(t, k, v)
        return v
    end
})

addon.L = L

local LOCALE = GetLocale()

if LOCALE == "enUS" then
    -- The EU English game client also
    -- uses the US English locale code.
    --L["GLYPHS"] = "Glyphs"
    L["MARKS"] = "Marks"
    L["GRIMOIRES"] = "Grimoires"
    L["VIEW_ALL"] = "View all"
    L["REFRESH_MSG"] = "Finished loading, please click Refresh"
    return
end

if LOCALE == "deDE" then
    -- German translations go here
    --L["GLYPHS"] = "Glyphen"
    L["MARKS"] = "Male"
    L["GRIMOIRES"] = "Grimoires"
    L["VIEW_ALL"] = "Alles anzeigen"
    L["REFRESH_MSG"] = "Fertig geladen, bitte Aktualisieren"
    return
end

if LOCALE == "esES" or LOCALE == "esMX" then
    -- Spanish translations go here
    --L["GLYPHS"] = "Glifos"
    L["MARKS"] = "Marcas"
    L["GRIMOIRES"] = "Grimorios"
    L["VIEW_ALL"] = "Ver todos"
    L["REFRESH_MSG"] = "Terminado de cargar, por favor haga clic en Actualizar"
    return
end

if LOCALE == "frFR" then
    -- French translations go here
    --L["GLYPHS"] = "Glyphes"
    L["MARKS"] = "Marques"
    L["GRIMOIRES"] = "Grimoires"
    L["VIEW_ALL"] = "Voir tout"
    L["REFRESH_MSG"] = "Chargement terminé, veuillez Actualiser"
    return
end

if LOCALE == "itIT" then
    -- Italian translations go here
    --L["GLYPHS"] = "Glifi"
    L["MARKS"] = "Marchi"
    L["GRIMOIRES"] = "Riti"
    L["VIEW_ALL"] = "Visualizza tutto"
    L["REFRESH_MSG"] = "Caricamento terminato, fare clic su Aggiorna"
    return
end

if LOCALE == "ptBR" then
    -- Brazilian Portuguese translations go here
    -- Note that the EU Portuguese WoW client also
    -- uses the Brazilian Portuguese locale code.
    --L["GLYPHS"] = "Glifos"
    L["MARKS"] = "Marcas"
    L["GRIMOIRES"] = "Grimórios"
    L["VIEW_ALL"] = "Visualizar tudo"
    L["REFRESH_MSG"] = "Carregamento concluído, por favor clique Atualizar"
    return
end

if LOCALE == "ruRU" then
    -- Russian translations go here
    --L["GLYPHS"] = "Символы"
    L["MARKS"] = "Метки"
    L["GRIMOIRES"] = "Гримуары"
    L["VIEW_ALL"] = "Посмотреть все"
    L["REFRESH_MSG"] = "Завершена загрузка, пожалуйста, нажмите Обновить"
    return
end

if LOCALE == "koKR" then
    -- Korean translations go here
    --L["GLYPHS"] = "문양들"
    L["MARKS"] = "징표들"
    L["GRIMOIRES"] = "흑마법서"
    L["VIEW_ALL"] = "전체 보기"
    L["REFRESH_MSG"] = "로드를 마쳤습니다. 새로 고침을 클릭하십시오."
    return
end

if LOCALE == "zhCN" then
    -- Simplified Chinese translations go here
    --L["GLYPHS"] = "雕文"
    L["MARKS"] = "印记"
    L["GRIMOIRES"] = "魔典"
    L["VIEW_ALL"] = "查看所有"
    L["REFRESH_MSG"] = "已完成加载，请点击刷新键"
    return
end

if LOCALE == "zhTW" then
    -- Traditional Chinese translations go here
    --L["GLYPHS"] = "雕文"
    L["MARKS"] = "印記"
    L["GRIMOIRES"] = "魔典"
    L["VIEW_ALL"] = "檢視全部"
    L["REFRESH_MSG"] = "已完成加載，請點擊刷新鍵"
    return
end
