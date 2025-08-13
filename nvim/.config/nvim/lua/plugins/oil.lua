return {
  "stevearc/oil.nvim",
  opts = {},
  enabled = false,
  config = function()
    require("oil").setup()
    vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Browse files from here" })
  end,
}
