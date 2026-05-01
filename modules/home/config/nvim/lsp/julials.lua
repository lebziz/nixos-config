return {
  cmd = {"julia"},
  filetypes = {'jl'},
  root_dir = function(bufnr, on_dir)
    local path = vim.api.nvim_buf_get_name(bufnr)
    local dir = vim.fn.fnamemodify(path, ":p:h")
    on_dir(dir)
  end,
}
