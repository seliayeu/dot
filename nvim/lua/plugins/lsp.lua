return {
  "nvim-lspconfig",
  lazy = false,
  after = function()
    vim.lsp.enable("clangd")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("nixd")
  end
}
