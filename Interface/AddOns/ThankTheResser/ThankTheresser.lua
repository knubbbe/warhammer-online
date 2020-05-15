--Written with insperation from ThankTheHealer, for RoR by Sullemunk

ThankTheResser = {}

local function print(text)
	EA_ChatWindow.Print(towstring(text))
end

--Prints out the usage message
function ThankTheResser.PrintUsage()
	print("")
	print("ThankTheResser usage:")
	print("/ThankTheResser off - turn Thank The Resser off")
	print("/ThankTheResser <word> - set phrase upon ressurection")
	print("Use %p to insert the ressurecter's name")
	print("/trr can be used instead of /ThankTheResser")
	if (ThankTheResser.Settings.Word ~= nil) then
		print(towstring("Current phrase is \"")..ThankTheResser.Settings.Word..towstring("\"."))
	else
		print("Thank The Resser is currently disabled.")
	end
end

--This function is beeing called when the addon starts from ThankTheResser.mod
function ThankTheResser.Initialize()
	if (ThankTheResser.Settings == nil) then
		ThankTheResser.Settings = {}
	end

--Checks if Libslash is installed
	if (LibSlash == nil) then
		print("ThankTheResser couldn't find LibSlash!")
		return
	end

--Registers the /slash commands 
	LibSlash.RegisterSlashCmd("ThankTheResser", function(input) ThankTheResser.Command(input) end)
	LibSlash.RegisterSlashCmd("ttr", function(input) ThankTheResser.Command(input) end)

--Prints out that the mod is loaded	
	print("<icon00057> Thank the resser 1.2 Loaded use /ThankTheResser or /ttr ")
		if (ThankTheResser.Settings.Word ~= nil) then
		print(towstring("   <icon00062>Current phrase is \"")..ThankTheResser.Settings.Word..towstring("\"."))
		end

--Listens for for the player to accept ressurection and calls ThankTheResser.ThankThem function
	RegisterEventHandler(SystemData.Events.RESURRECTION_ACCEPT, "ThankTheResser.ThankThem")
--		RegisterEventHandler(SystemData.Events.PLAYER_BEGIN_CAST, "ThankTheResser.ThankThem")   for debugging
	RegisterEventHandler(SystemData.Events.PLAYER_DEATH_CLEARED, "ThankTheResser.ResserName")

end


--Unregister the /slash commands if the mod is turned off so it can be used by other addons (not likely)
function ThankTheResser.Shutdown()
	UnregisterEventHandler(SystemData.Events.RESURRECTION_ACCEPT, "ThankTheResser.ThankThem")
	LibSlash.UnregisterSlashCmd("ttr")
	LibSlash.UnregisterSlashCmd("ThankTheResser")
end

--Listens for the /slash command from the textbox. If no additional text is applied to set the word, the usage message is shown
function ThankTheResser.Command(input)
	if (input == "") then
		ThankTheResser.PrintUsage()
		return
	end

--Turns the addon on/off	
	if (input == "off") then
		ThankTheResser.Settings.Word = nil
		print("Thank The Resser disabled")
	else
		ThankTheResser.Settings.Word = towstring(input)
		print("Thank The Resser enabled")
	end
end

function ThankTheResser.ResserName()
if DoesWindowExist("TwoButtonDlg1Box") then
RessText = LabelGetText("TwoButtonDlg1BoxText")
RessName = RessText:match(L"([%a]+).")
d(RessName)
end


	
end

--After a sucessfull ressurection this function is called
function ThankTheResser.ThankThem()

if DoesWindowExist("TwoButtonDlg1Box") then
RessText = LabelGetText("TwoButtonDlg1BoxText")
RessName = RessText:match(L"([%a]+).")

end
local ColorName = L"<LINK data=\"0\" text=\""..towstring(RessName)..L" \" color=\"25,155,255\">"
local sayword = ThankTheResser.Settings.Word:gsub(L"%%[Pp]", ColorName)
--Sends the message to chat :
SendChatText(towstring("/say ")..sayword, L"")

end