return {
  "nvim-lspconfig",
  lazy = false,
  after = function()
    vim.lsp.enable("clangd")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("nixd")
    vim.keymap.set('n', '<space>cd', vim.diagnostic.open_float)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'gD', function()
      vim.cmd('tab split')
      vim.lsp.buf.definition()
    end)
  end,
}
