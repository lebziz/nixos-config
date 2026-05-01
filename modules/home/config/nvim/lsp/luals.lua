return {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	-- root_markers = { '.luarc.json', '.luarc.jsonc' },
	root_dir = function(bufnr, on_dir)
		local path = vim.api.nvim_buf_get_name(bufnr)
		local dir = vim.fn.fnamemodify(path, ":p:h")
		on_dir(dir)
	end,
}
