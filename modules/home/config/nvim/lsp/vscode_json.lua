return {
  cmd = {"vscode-json-language-server", "--stdio"},
  filetypes = {'json'},
  root_dir = function(bufnr, on_dir)
    local path = vim.api.nvim_buf_get_name(bufnr)
    local dir = vim.fn.fnamemodify(path, ":p:h")
    on_dir(dir)
  end,
}
