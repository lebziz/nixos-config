return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_dir = function(bufnr, on_dir)
    local path = vim.api.nvim_buf_get_name(bufnr)
    local cargo_toml = vim.fs.find("Cargo.toml", { upward = true, path = path })[1]
    if cargo_toml then
      on_dir(vim.fs.dirname(cargo_toml))
    else
      -- No Cargo.toml found, don't start rust-analyzer by not calling on_dir
      -- (or you can do on_dir(nil) but better to just skip)
      -- This will make LSP client NOT attach for standalone files
      -- You could also do: return nil here
    end
  end,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
        loadOutDirsFromCheck = true,
        linkedProjects = {},
      },
      checkOnSave = {
        enable = true,
        command = "clippy",
      },
      procMacro = {
        enable = true,
      },
    },
  },
}
