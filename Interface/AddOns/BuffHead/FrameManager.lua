BuffHead.FrameManager = {};

local frameList = {};
local tableRemove = table.remove;
local tableInsert = table.insert;

function BuffHead.FrameManager.GetFrame()

	if (#frameList > 0) then
		local frame = tableRemove(frameList);
		return frame;
	end
	
	return nil;

end

function BuffHead.FrameManager.ReleaseFrame(frame)

	tableInsert(frameList, frame);

end

function BuffHead.FrameManager.DestroyFrames()

	for index, frame in ipairs(frameList) do
	
		DestroyWindow(frame:GetName());
		FrameManager:Remove(frame:GetName());
	
	end
	
	frameList = {};

end