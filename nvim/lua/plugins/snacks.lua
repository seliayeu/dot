return {
  "snacks.nvim",
  lazy = false,
  keys = {
    { "<space>e", function() Snacks.explorer() end },
  },
  after = function()
    local opts = {
      bigfile = { enabled = false },
      dashboard = { enabled = false },
      explorer = {
          enabled = false
      },
      indent = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = false },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
      picker = {
        enabled = true,
        sources = {
          explorer = {
            win = {
              input = {
                keys = {
                  ['<C-t>'] = { 'tab', mode = { 'i', 'n' } },
                },
              },
              list = {
                keys = {
                  ['<C-t>'] = 'tab',
                },
              },
            },
          },
        },
      },
    }
    require("snacks").setup(opts)
  end,
}
