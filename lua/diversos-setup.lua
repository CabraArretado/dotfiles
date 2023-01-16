-- Place to install small plugins setups

local default_only_plugins = {'hop'}

for _, plugin in ipairs(default_only_plugins) do
    require(plugin).setup({})

end
