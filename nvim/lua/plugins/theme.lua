return {
  "gruvbox.nvim",
  lazy = false,
  priority = 1000,
  colorscheme = "gruvbox",
  after = function()
    require("gruvbox").setup({
      transparent_mode = true
    })
    vim.o.background = "dark"
    vim.cmd("colorscheme gruvbox")
  end
}
