return {
  "snacks.nvim",
  lazy = false,
  opts = {
    explorer = {
      enabled = true,
      replace_netrw = true,
    }
  },
  keys = {
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
  }
}
