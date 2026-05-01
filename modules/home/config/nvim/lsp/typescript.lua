return {
  cmd = {"typescript-language-server", "--stdio"},
  filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
  root_dir = function(bufnr, on_dir)
    local path = vim.api.nvim_buf_get_name(bufnr)
    local dir = vim.fn.fnamemodify(path, ":p:h")
    on_dir(dir)
  end,
}
