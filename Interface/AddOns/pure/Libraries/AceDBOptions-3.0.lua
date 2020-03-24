-- Originally written by the Ace Team, ported to WAR by Werelds
local ACEDBO_MAJOR, ACEDBO_MINOR = "WAR-AceDBOptions-3.0", 9
local AceDBOptions, oldminor = LibStub:NewLibrary(ACEDBO_MAJOR, ACEDBO_MINOR)

if not AceDBOptions then return end -- No upgrade needed

AceDBOptions.optionTables = AceDBOptions.optionTables or {}
AceDBOptions.handlers = AceDBOptions.handlers or {}

local function prepareString(input)
	-- Convert to string.
	if (type(input) == "wstring") then
		input = WStringToString(input)
	else
		input = tostring(input)
	end

	-- Remove suffix.
	input = input:gsub("%^[fFmM]", "")
	
	-- Done..For now.
	return input
end

local careerLineMap = {}

for k, v in pairs( GameData.CareerLine )
do
	careerLineMap[v] = { Name = CareerNames[v].name }
	
	if( v == 1 or v == 2 or v == 3 or v == 4 or v == 9 or v == 10 or v == 11 
		or v == 12 or v == 17 or v == 18 or v == 19 or v == 20 ) then
		careerLineMap[v].Faction = 1
	else
		careerLineMap[v].Faction = 2
	end
end

-- Storing careerline for use in the keys
local careerLine = GetCareerLineFromId( GameData.Player.career.id )
local realmKey = GameData.Account.ServerName
local charKey = GameData.Player.name .. L" - " .. realmKey
local raceKey = RaceNames[GameData.Player.race.id].name
local classKey = careerLineMap[careerLine].Name
local factionKey = GetRealmName( careerLineMap[careerLine].Faction )

local accountCharKeys = {}
for k,v in pairs( GameData.Account.CharacterSlot )
do
	if( v.Level > 0 ) then
		local idx = k .. " - " .. prepareString( realmKey )
		accountCharKeys[idx] = v.Name .. L" - " .. realmKey
	end	
end

--[[
	Localization of AceDBOptions-3.0
]]
local T = {
	default = "Default",
	intro = "You can change the active database profile, so you can have different settings for every character.",
	reset_desc = "Reset the current profile back to its default values, in case your configuration is broken, or you simply want to start over.",
	reset = "Reset Profile",
	reset_sub = "Reset the current profile to the default",
	choose_desc = "You can either create a new profile by entering a name in the editbox, or choose one of the already exisiting profiles.",
	new = "New",
	new_sub = "Create a new empty profile.",
	choose = "Existing Profiles",
	choose_sub = "Select one of your currently available profiles.",
	copy_desc = "Copy the settings from one existing profile into the currently active profile.",
	copy = "Copy From",
	delete_desc = "Delete existing and unused profiles from the database to save space, and cleanup the SavedVariables file.",
	delete = "Delete a Profile",
	delete_sub = "Deletes a profile from the database.",
	delete_confirm = "Are you sure you want to delete the selected profile?",
	profiles = "Profiles",
	profiles_sub = "Manage Profiles",
}

-- Quick lookup table again!
local LocaleNameById = {
    [SystemData.Settings.Language.ENGLISH] = "enUS",
    [SystemData.Settings.Language.FRENCH] = "frFR",
    [SystemData.Settings.Language.GERMAN] = "deDE",
    [SystemData.Settings.Language.ITALIAN] = "itIT",
    [SystemData.Settings.Language.S_CHINESE] = "zhCN",
    [SystemData.Settings.Language.T_CHINESE] = "zhTW",
    [SystemData.Settings.Language.RUSSIAN] = "ruRU",
    [SystemData.Settings.Language.JAPANESE] = "jpJP",
    [SystemData.Settings.Language.KOREAN] = "koKR",
}

local LOCALE = LocaleNameById[SystemData.Settings.Language.active]
if LOCALE == "deDE" then
	T["default"] = "Standard"
	T["intro"] = "Hier kannst du das aktive Datenbankprofile \195\164ndern, damit du verschiedene Einstellungen f\195\188r jeden Charakter erstellen kannst, wodurch eine sehr flexible Konfiguration m\195\182glich wird." 
	T["reset_desc"] = "Setzt das momentane Profil auf Standardwerte zur\195\188ck, f\195\188r den Fall das mit der Konfiguration etwas schief lief oder weil du einfach neu starten willst."
	T["reset"] = "Profil zur\195\188cksetzen"
	T["reset_sub"] = "Das aktuelle Profil auf Standard zur\195\188cksetzen."
	T["choose_desc"] = "Du kannst ein neues Profil erstellen, indem du einen neuen Namen in der Eingabebox 'Neu' eingibst, oder w\195\164hle eines der vorhandenen Profile aus."
	T["new"] = "Neu"
	T["new_sub"] = "Ein neues Profil erstellen."
	T["choose"] = "Vorhandene Profile"
	T["choose_sub"] = "W\195\164hlt ein bereits vorhandenes Profil aus."
	T["copy_desc"] = "Kopiere die Einstellungen von einem vorhandenen Profil in das aktive Profil."
	T["copy"] = "Kopieren von..."
	T["delete_desc"] = "L\195\182sche vorhandene oder unbenutzte Profile aus der Datenbank um Platz zu sparen und um die SavedVariables Datei 'sauber' zu halten."
	T["delete"] = "Profil l\195\182schen"
	T["delete_sub"] = "L\195\182scht ein Profil aus der Datenbank."
	T["delete_confirm"] = "Willst du das ausgew\195\164hlte Profil wirklich l\195\182schen?"
	T["profiles"] = "Profile"
	T["profiles_sub"] = "Profile verwalten"
elseif LOCALE == "frFR" then
	T["default"] = "D\195\169faut"
	T["intro"] = "Vous pouvez changer le profil actuel afin d'avoir des param\195\168tres diff\195\169rents pour chaque personnage, permettant ainsi d'avoir une configuration tr\195\168s flexible."
	T["reset_desc"] = "R\195\169initialise le profil actuel au cas o\195\185 votre configuration est corrompue ou si vous voulez tout simplement faire table rase."
	T["reset"] = "R\195\169initialiser le profil"
	T["reset_sub"] = "R\195\169initialise le profil actuel avec les param\195\168tres par d\195\169faut."
	T["choose_desc"] = "Vous pouvez cr\195\169er un nouveau profil en entrant un nouveau nom dans la bo\195\174te de saisie, ou en choississant un des profils d\195\169j\195\160 existants."
	T["new"] = "Nouveau"
	T["new_sub"] = "Cr\195\169\195\169e un nouveau profil vierge."
	T["choose"] = "Profils existants"
	T["choose_sub"] = "Permet de choisir un des profils d\195\169j\195\160 disponibles."
	T["copy_desc"] = "Copie les param\195\168tres d'un profil d\195\169j\195\160 existant dans le profil actuellement actif."
	T["copy"] = "Copier \195\160 partir de"
	T["delete_desc"] = "Supprime les profils existants inutilis\195\169s de la base de donn\195\169es afin de gagner de la place et de nettoyer le fichier SavedVariables."
	T["delete"] = "Supprimer un profil"
	T["delete_sub"] = "Supprime un profil de la base de donn\195\169es."
	T["delete_confirm"] = "Etes-vous s\195\187r de vouloir supprimer le profil s\195\169lectionn\195\169 ?"
	T["profiles"] = "Profils"
	T["profiles_sub"] = "Gestion des profils"
elseif LOCALE == "koKR" then
	T["default"] = "기본값"
	T["intro"] = "모든 캐릭터의 다양한 설정과 사용중인 데이터베이스 프로필, 어느것이던지 매우 다루기 쉽게 바꿀수 있습니다." 
	T["reset_desc"] = "단순히 다시 새롭게 구성을 원하는 경우, 현재 프로필을 기본값으로 초기화 합니다."
	T["reset"] = "프로필 초기화"
	T["reset_sub"] = "현재의 프로필을 기본값으로 초기화 합니다"
	T["choose_desc"] = "새로운 이름을 입력하거나, 이미 있는 프로필중 하나를 선택하여 새로운 프로필을 만들 수 있습니다."
	T["new"] = "새로운 프로필"
	T["new_sub"] = "새로운 프로필을 만듭니다."
	T["choose"] = "프로필 선택"
	T["choose_sub"] = "당신이 현재 이용할수 있는 프로필을 선택합니다."
	T["copy_desc"] = "현재 사용중인 프로필에, 선택한 프로필의 설정을 복사합니다."
	T["copy"] = "복사"
	T["delete_desc"] = "데이터베이스에 사용중이거나 저장된 프로파일 삭제로 SavedVariables 파일의 정리와 공간 절약이 됩니다."
	T["delete"] = "프로필 삭제"
	T["delete_sub"] = "데이터베이스의 프로필을 삭제합니다."
	T["delete_confirm"] = "정말로 선택한 프로필의 삭제를 원하십니까?"
	T["profiles"] = "프로필"
	T["profiles_sub"] = "프로필 설정"
elseif LOCALE == "esES" then

elseif LOCALE == "itIT" then

elseif LOCALE == "jpJP" then

elseif LOCALE == "zhTW" then
	T["default"] = "預設"
	T["intro"] = "你可以選擇一個活動的資料設定檔，這樣你的每個角色就可以擁有不同的設定值，可以給你的插件設定帶來極大的靈活性。" 
	T["reset_desc"] = "將當前的設定檔恢復到它的預設值，用於你的設定檔損壞，或者你只是想重來的情況。"
	T["reset"] = "重置設定檔"
	T["reset_sub"] = "將當前的設定檔恢復為預設值"
	T["choose_desc"] = "你可以通過在文本框內輸入一個名字創立一個新的設定檔，也可以選擇一個已經存在的設定檔。"
	T["new"] = "新建"
	T["new_sub"] = "新建一個空的設定檔。"
	T["choose"] = "現有的設定檔"
	T["choose_sub"] = "從當前可用的設定檔裏面選擇一個。"
	T["copy_desc"] = "從當前某個已保存的設定檔複製到當前正使用的設定檔。"
	T["copy"] = "複製自"
	T["delete_desc"] = "從資料庫裏刪除不再使用的設定檔，以節省空間，並且清理SavedVariables檔。"
	T["delete"] = "刪除一個設定檔"
	T["delete_sub"] = "從資料庫裏刪除一個設定檔。"
	T["delete_confirm"] = "你確定要刪除所選擇的設定檔嗎？"
	T["profiles"] = "設定檔"
	T["profiles_sub"] = "管理設定檔"
elseif LOCALE == "zhCN" then
	T["default"] = "默认"
	T["intro"] = "你可以选择一个活动的数据配置文件，这样你的每个角色就可以拥有不同的设置值，可以给你的插件配置带来极大的灵活性。" 
	T["reset_desc"] = "将当前的配置文件恢复到它的默认值，用于你的配置文件损坏，或者你只是想重来的情况。"
	T["reset"] = "重置配置文件"
	T["reset_sub"] = "将当前的配置文件恢复为默认值"
	T["choose_desc"] = "你可以通过在文本框内输入一个名字创立一个新的配置文件，也可以选择一个已经存在的配置文件。"
	T["new"] = "新建"
	T["new_sub"] = "新建一个空的配置文件。"
	T["choose"] = "现有的配置文件"
	T["choose_sub"] = "从当前可用的配置文件里面选择一个。"
	T["copy_desc"] = "从当前某个已保存的配置文件复制到当前正使用的配置文件。"
	T["copy"] = "复制自"
	T["delete_desc"] = "从数据库里删除不再使用的配置文件，以节省空间，并且清理SavedVariables文件。"
	T["delete"] = "删除一个配置文件"
	T["delete_sub"] = "从数据库里删除一个配置文件。"
	T["delete_confirm"] = "你确定要删除所选择的配置文件么？"
	T["profiles"] = "配置文件"
	T["profiles_sub"] = "管理配置文件"
elseif LOCALE == "ruRU" then
	T["default"] = "По умолчанию"
	T["intro"] = "Вы можете сменить активный профиль БД, этим вы можете устанавливать различные настройки для каждого персонажа."
	T["reset_desc"] = "Сброс текущего профиля на его стандартные значения, в том случаи если ваша конфигурация испорчена, или вы желаете всё перенастроить заново."
	T["reset"] = "Сброс профиля"
	T["reset"] = "Сброс текущего профиля на стандартный"
	T["choose_desc"] = "Вы можете создать новый профиль введя название в поле ввода, или выбрать один из уже существующих профилей."
	T["new"] = "Новый"
	T["new_sub"] = "Создать новый чистый профиль."
	T["choose"] = "Профиля"
	T["choose_sub"] = "Выберите один из уже доступных профилей."
	T["copy_desc"] = "Скопировать настройки профиля в на данный момент активный профиль."
	T["copy"] = "Скопировать с"
	T["delete_desc"] = "Удалить существующий и неиспользуемый профиль из БД для сохранения места, и очистить SavedVariables файл."
	T["delete"] = "Удалить профиль"
	T["delete_sub"] = "Удаления профиля из БД."
	T["delete_confirm"] = "Вы уверены что вы хотите удалить выбранный профиль?"
	T["profiles"] = "Профиля"
	T["profiles_sub"] = "Управление профилями"
end

local defaultProfiles
local tmpprofiles = {}

--[[
	getProfileList(db, common, nocurrent)
	
	db - the db object to retrieve the profiles from
	common (boolean) - if common is true, getProfileList will add the default profiles to the return list, even if they have not been created yet
	nocurrent (boolean) - if true then getProfileList will not display the current profile in the list
]]--
local function getProfileList(db, common, nocurrent)
	local profiles = {}
	
	-- copy existing profiles into the table
	local currentProfile = db:GetCurrentProfile()
	
	for i,v in pairs(db:GetProfiles(tmpprofiles)) do 
		if not (nocurrent and v == currentProfile) then 
			profiles[v] = v 
		end 
	end
	
	-- add our default profiles to choose from ( or rename existing profiles)
	for k,v in pairs(defaultProfiles) do
		if (common or profiles[k]) and not (nocurrent and k == currentProfile) then
			profiles[k] = v
		end
	end
	
	return profiles
end

--[[
	OptionsHandlerPrototype
	prototype class for handling the options in a sane way
]]
local OptionsHandlerPrototype = {}

--[[ Reset the profile ]]
function OptionsHandlerPrototype:Reset()
	self.db:ResetProfile()
end

--[[ Set the profile to value ]]
function OptionsHandlerPrototype:SetProfile(info, value)
	self.db:SetProfile(value)
end

function OptionsHandlerPrototype:GetProfileDisplayName( profile )
	if( self.db.keys["char"] == profile ) then 
		return charKey
	elseif( self.db.keys["realm"] == profile ) then
		return realmKey
	elseif( self.db.keys["class"] == profile ) then
		return classKey
	elseif( self.db.keys["race"] == profile ) then
		return raceKey
	elseif( self.db.keys["faction"] == profile ) then
		return factionKey
	elseif( self.db.keys["factionrealm"] == profile ) then
		return factionrealmKey
	elseif( self.db.keys["Default"] == profile ) then
		return T["default"]
	elseif( accountCharKeys[profile] ~= nil ) then
		return accountCharKeys[profile]
	end
	
	return nil
end

--[[ returns the currently active profile ]]
function OptionsHandlerPrototype:GetCurrentProfile()
	return self.db:GetCurrentProfile()
end

--[[ 
	List all active profiles
	you can control the output with the .arg variable
	currently four modes are supported
	
	(empty) - return all available profiles
	"nocurrent" - returns all available profiles except the currently active profile
	"common" - returns all available profiles + some commonly used profiles ("char - realm", "realm", "class", "Default")
	"both" - common except the active profile
]]
function OptionsHandlerPrototype:ListProfiles(info)
	local arg = info.arg
	local profiles
	if arg == "common" and not self.noDefaultProfiles then
		profiles = getProfileList(self.db, true, nil)
	elseif arg == "nocurrent" then
		profiles = getProfileList(self.db, nil, true)
	elseif arg == "both" then
		profiles = getProfileList(self.db, (not self.noDefaultProfiles) and true, true)
	else
		profiles = getProfileList(self.db)
	end
	
	return profiles
end

--[[ Copy a profile ]]
function OptionsHandlerPrototype:CopyProfile(info, value)
	self.db:CopyProfile(value)
end

--[[ Delete a profile from the db ]]
function OptionsHandlerPrototype:DeleteProfile(info, value)
	self.db:DeleteProfile(value)
end

--[[ fill defaultProfiles with some generic values ]]
local function generateDefaultProfiles(db)
	defaultProfiles = {
		["Default"] 			= T["default"],
		[db.keys.char] 			= charKey,
		[db.keys.realm] 		= realmKey,
		[db.keys.class] 		= classKey,
		[db.keys.race] 			= raceKey,
		[db.keys.faction] 		= factionKey,
		[db.keys.factionrealm]	= factionrealmKey,
	}
end

--[[ create and return a handler object for the db, or upgrade it if it already existed ]]
local function getOptionsHandler(db, noDefaultProfiles)
	if not defaultProfiles then
		generateDefaultProfiles(db)
	end
	
	local handler = AceDBOptions.handlers[db] or { db = db, noDefaultProfiles = noDefaultProfiles }
	
	for k,v in pairs(OptionsHandlerPrototype) do
		handler[k] = v
	end
	
	AceDBOptions.handlers[db] = handler
	return handler
end

--[[
	the real options table 
]]
local optionsTable = {
	desc = {
		order = 1,
		type = "description",
		name = T["intro"] .. "\n",
	},
	descreset = {
		order = 9,
		type = "description",
		name = T["reset_desc"],
	},
	reset = {
		order = 10,
		type = "execute",
		name = T["reset"],
		desc = T["reset_sub"],
		func = "Reset",
	},
	choosedesc = {
		order = 20,
		type = "description",
		name = "\n" .. T["choose_desc"],
	},
	new = {
		name = T["new"],
		desc = T["new_sub"],
		type = "input",
		order = 30,
		get = false,
		set = "SetProfile",
	},
	choose = {
		name = T["choose"],
		desc = T["choose_sub"],
		type = "select",
		order = 40,
		get = "GetCurrentProfile",
		set = "SetProfile",
		values = "ListProfiles",
		arg = "common",
	},
	copydesc = {
		order = 50,
		type = "description",
		name = "\n" .. T["copy_desc"],
	},
	copyfrom = {
		order = 60,
		type = "select",
		name = T["copy"],
		desc = T["copy_desc"],
		get = false,
		set = "CopyProfile",
		values = "ListProfiles",
		arg = "nocurrent",
	},
	deldesc = {
		order = 70,
		type = "description",
		name = "\n" .. T["delete_desc"],
	},
	delete = {
		order = 80,
		type = "select",
		name = T["delete"],
		desc = T["delete_sub"],
		get = false,
		set = "DeleteProfile",
		values = "ListProfiles",
		arg = "nocurrent",
		confirm = true,
		confirmText = T["delete_confirm"],
	},
}

--[[
	GetOptionsTable(db)
	db - the database object to create the options table for
	
	creates and returns a option table to be used in your addon
]]
function AceDBOptions:GetOptionsTable(db, noDefaultProfiles)
	local tbl = AceDBOptions.optionTables[db] or {
			type = "group",
			name = T["profiles"],
			desc = T["profiles_sub"],
		}
	
	tbl.handler = getOptionsHandler(db, noDefaultProfiles)
	tbl.args = optionsTable

	AceDBOptions.optionTables[db] = tbl
	return tbl
end

-- upgrade existing tables
for db,tbl in pairs(AceDBOptions.optionTables) do
	tbl.handler = getOptionsHandler(db)
	tbl.args = optionsTable
end
