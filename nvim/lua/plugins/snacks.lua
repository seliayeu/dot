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
  keys = {
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
  }
}
