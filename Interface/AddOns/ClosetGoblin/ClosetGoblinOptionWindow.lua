--[[
Copyright (c) 2008, Naeru@Ulthuan
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation  
and/or other materials provided with the distribution.
Neither the name of the Candymancer Coding Company nor the names of its contributors may be used to endorse or promote products derived from 
this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR 
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE 
USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]
-- Yeah sure, those 30 lines are copyright worthy; Wothor

ClosetGoblinOptionWindow = {};

--[[
   Option Window Event Handlers
 ]]

function ClosetGoblinOptionWindow.OnInitialize()	
	LayoutEditor.RegisterWindow("ClosetGoblinOptionWindow",L"Closet Goblin",L"Option Button", true, true, true, nil);
end;

function ClosetGoblinOptionWindow.OnLButtonUp()
	if ClosetGoblin.sortedSetsList ~= nil then
		EA_Window_ContextMenu.CreateContextMenu(SystemData.ActiveWindow.name);
		for index, setName in ipairs(ClosetGoblin.sortedSetsList) do
			EA_Window_ContextMenu.AddMenuItem(cgL["Equip_set"]:gsub(L"#1#", setName), ClosetGoblinOptionWindow.OnRowMenuActivateSet, false, true);
		end;
		EA_Window_ContextMenu.Finalize();
	else
		ClosetGoblinCharacterWindow.ShowOrHide();
	end;
end;

function ClosetGoblinOptionWindow.OnRButtonUp()
	ClosetGoblinCharacterWindow.ShowOrHide();
end;


function ClosetGoblinOptionWindow.OnRowMenuActivateSet()
	local idContextMenu = WindowGetId(SystemData.MouseOverWindow.name);
	ClosetGoblin.Update(idContextMenu)
	ClosetGoblin.ActivateSet(ClosetGoblin.sortedSetsList[idContextMenu]);
	DoTheSet = idContextMenu
end;