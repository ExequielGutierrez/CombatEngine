CE_LANG = {}
if GetLanguage() == "ES" then
    CE_LANG = CE_LANG_ES
elseif GetLanguage() == "PL" then
    CE_LANG = CE_LANG_PL
elseif GetLanguage() == "DE" then
    CE_LANG = CE_LANG_DE
elseif GetLanguage() == "RU" then
    CE_LANG = CE_LANG_RU
elseif GetLanguage() == "CN" then
    CE_LANG = CE_LANG_CN
else
    CE_LANG = CE_LANG_EN
end