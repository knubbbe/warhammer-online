--------------------------------------------------------------------------------
-- Copyright (c) 2008 Bloodwalker <metagamegeek@gmail.com>
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
--
--------------------------------------------------------------------------------
-- File:      Libs/LibToolkit.lua
-- Date:      2009-02-08T04:20:19Z
-- Author:    Bloodwalker
-- Version:   Release v0.5.1
-- Revision:  32
-- File Rev:  32
-- Copyright: 2008
--------------------------------------------------------------------------------
LibToolkit = {}
--------------------------------------------------------------------------------
--#
--#			Chat window Functions
--#
--------------------------------------------------------------------------------

function LibToolkit.NewChatFilter(filterId, textColor)
	TextLogAddFilterType("Chat", filterId, L"")
	LogDisplaySetFilterColor("EA_ChatTab1TextLog", "Chat", filterId, textColor.r, textColor.g, textColor.b)

	-- Make sure we arent spamming all the chat tabs by turning the filter off for each of them
	for idx, tabData in ipairs(EA_ChatTabManager.Tabs) do
		if (tabData.used == true) then
			LogDisplaySetFilterState("EA_ChatTab" .. idx .. "TextLog", "Chat", filterId, false)
		end
	end

	-- Enable message to the first chat tab only
	LogDisplaySetFilterState("EA_ChatTab1TextLog", "Chat", filterId, true)
end
