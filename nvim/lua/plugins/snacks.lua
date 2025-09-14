return {
  "snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    explorer = {
      enabled = true,
      replace_netrw = true,
    },
    picker = {
      enabled = true,
      replace_netrw = true,
    }
  },
  after = function()
    require("snacks").setup()
    vim.keymap.set('n', '<space>e', function() Snacks.explorer() end)
  end,
}
