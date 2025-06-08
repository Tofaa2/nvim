require("config.options")
require("config.keymaps")
require("config.autocommands")
require("config.lazy")

function color(name)
	local color = name
	if name == nil then
		vim.notify("Color name is nil, defaulting to gruvbox", vim.log.levels.WARN)
		color = "gruvbox"
	end
	local ok, _ = pcall(vim.cmd, "colorscheme " .. color)
	if not ok then
		vim.notify("Colorscheme '" .. color .. "' not found, defaulting to gruvbox", vim.log.levels.ERROR)
		vim.cmd("colorscheme gruvbox")
	end
end

color("gruvbox") -- Set your preferred colorscheme here
