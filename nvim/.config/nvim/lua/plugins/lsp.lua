return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "clangd", "tailwindcss", "lua_ls", "rust_analyzer", "emmet_language_server", "biome" },
      }
    end,
  },
}
