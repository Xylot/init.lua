local add, now = MiniDeps.add, MiniDeps.now

local function get_if_available(name, opts)
	local lua_ok, colorscheme = pcall(require, name)
	if lua_ok then
		colorscheme.setup(opts)
		return name
	end

	local vim_ok, _ = pcall(vim.cmd.colorscheme, name)
	if vim_ok then
		return name
	end

	return "default"
end

now(function()
    add('rose-pine/neovim')

    local color_scheme = get_if_available('rose-pine')
    vim.cmd.colorscheme(color_scheme)
end)
