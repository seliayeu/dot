return {
  "nvim-lspconfig",
  lazy = false,
  after = function()
    vim.lsp.enable("clangd", { cmd = { "clangd", "--log=verbose" } })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'LSP signature help' })
  end
}
