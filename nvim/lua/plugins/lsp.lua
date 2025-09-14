return {
  "nvim-lspconfig",
  lazy = false,
  after = function()
    vim.lsp.enable("clangd")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("nixd")
    vim.keymap.set('n', '<space>cd', vim.diagnostic.open_float)
  end,
}
