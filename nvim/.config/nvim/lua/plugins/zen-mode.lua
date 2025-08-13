return {
  {
    "folke/twilight.nvim",
    opts = {},
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      vim.keymap.set("n", "<leader>z", function()
        require("zen-mode").toggle {
          window = {
            width = 0.8,
            options = {
              relativenumber = false,
              number = false,
            },
          },
          plugins = {
            twilight = { enabled = true },
          },
        }
      end, { desc = "Toggle zen mode", silent = true, noremap = true })
    end,
  },
}
