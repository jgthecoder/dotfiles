return {
  {
    "kshenoy/vim-signature",
    enabled = false,
  },
  {
    "tpope/vim-sleuth",
  },
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.sessions").setup()
    end,
    enabled = false,
  },
  {
    "folke/neoconf.nvim",
    enabled = false,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
    enabled = false,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      {
        "<leader><space>",
        function()
          Snacks.picker.smart()
        end,
        desc = "Smart Find Files",
      },
      {
        "<leader>e",
        function()
          Snacks.explorer()
        end,
        desc = "File Explorer",
      },
    },
    enabled = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
    },
  },
  {
    "Bekaboo/dropbar.nvim",
    enabled = false,
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    config = function()
      local dropbar_api = require "dropbar.api"
      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
      vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
  },
  {
    enabled = false,
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        window = {
          winblend = 0,
        },
      },
    },
  },
}
