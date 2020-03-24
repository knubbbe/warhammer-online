nRarity = {}

-- version and revision
local projectVersion = "2.4-release"
if projectVersion == "@".."project-version".."@" then
	nRarity.VERSION_MAJOR = 2
	nRarity.VERSION_MINOR = 0
else
	nRarity.VERSION_MAJOR = tonumber(projectVersion:match("^(%d+)%."))
	nRarity.VERSION_MINOR = tonumber(projectVersion:match("^%d+%.(%d+)"))
	nRarity.VERSION_POINT = tonumber(projectVersion:match("^%d+%.%d+%.(%d+)"))
	nRarity.QUALITY = projectVersion:match("-(.+)$")
	nRarity.REVISION = "151"
end

-- members
nRarity.containers = {}

-- initialise function for the entire addon
function nRarity.init()
	local success, err
	local addons = ModulesGetData()

	-- initialise each container, loading its addon first if required
	for _, container in pairs(nRarity.containers) do
		for _, addon in ipairs(addons) do
			if addon.name == container.addonName then
				if addon.isEnabled then
					if not addon.isLoaded then
						DEBUG(L"nRarity loading addon "..towstring(addon.name))
						ModuleInitialize(addon.name)
					end
					success, err = pcall(container.init, container)
					if not success then
						DEBUG(L"nRarity failure loading module "..towstring(container.name)..L" "..towstring(err))
					end
				end
			end
		end
	end
end
