return {
  "ibhagwan/fzf-lua",
  -- dependencies = { 'nvim-tree/nvim-web-devicons' },
  dependencies = { "echasnovski/mini.icons" },
  keys = {
    { "<leader>fb", ":FzfLua buffers<cr>", desc = "Find open buffers" },
    { "<leader>ff", ":FzfLua files<cr>", desc = "Find Files" },
    { "<leader>fg", ":FzfLua live_grep<cr>", desc = "Find using live grep" },
    { "<leader>fc", ":FzfLua files cwd=$HOME/.config/nvim<cr>", desc = "Find in nvim config" },
    { "<leader>fh", ":FzfLua helptags<cr>", desc = "Find in nvim help pages" },
    { "<leader>gf", ":FzfLua git_files<cr>", desc = "Find in nvim config" },
  },
  config = function()
    require("fzf-lua").setup()
    vim.cmd [[ FzfLua register_ui_select ]]
  end,
}
