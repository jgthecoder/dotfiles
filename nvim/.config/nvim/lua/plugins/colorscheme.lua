local colorschemes = {
  onedark = {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("onedark").setup {
        style = "darker",
        transparent = true,
      }
      -- Enable theme
      require("onedark").load()
    end,
  },
  nord = {
    "shaunsingh/nord.nvim",
    config = function()
      vim.g.nord_disable_background = true
      vim.g.nord_italic = false
      vim.cmd.colorscheme "nord"
    end,
  },
  nordic = {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup {
        -- on_palette = function(palette)
        --   palette.black0 = '#131517'
        -- end,
        transparent = {
          bg = true,
          float = true,
        },
      }
      vim.cmd.colorscheme "nordic"
    end,
  },
  oxocarbon = {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      -- vim.cmd.colorscheme("oxocarbon")
    end,
  },
  mellow = {
    "mellow-theme/mellow.nvim",
    config = function()
      -- Configure the appearance
      vim.g.mellow_italic_functions = true
      vim.g.mellow_bold_functions = true

      vim.g.mellow_highlight_overrides = {
        ["NormalNC"] = { link = "Normal" },
      }

      -- Load the colorscheme
      vim.cmd [[colorscheme mellow]]
    end,
  },
  vague = {
    "vague2k/vague.nvim",
    config = function()
      require("vague").setup {
        transparent = false, -- don't set background
        style = {
          -- "none" is the same thing as default. But "italic" and "bold" are also valid options
          boolean = "bold",
          number = "none",
          float = "none",
          error = "bold",
          comments = "italic",
          conditionals = "none",
          functions = "none",
          headings = "bold",
          operators = "none",
          strings = "none",
          variables = "none",

          -- keywords
          keywords = "none",
          keyword_return = "italic",
          keywords_loop = "none",
          keywords_label = "none",
          keywords_exception = "none",

          -- builtin
          builtin_constants = "bold",
          builtin_functions = "none",
          builtin_types = "bold",
          builtin_variables = "none",
        },
        -- plugin styles where applicable
        -- make an issue/pr if you'd like to see more styling options!
        plugins = {
          cmp = {
            match = "bold",
            match_fuzzy = "bold",
          },
          dashboard = {
            footer = "italic",
          },
          lsp = {
            diagnostic_error = "bold",
            diagnostic_hint = "none",
            diagnostic_info = "italic",
            diagnostic_warn = "bold",
          },
          neotest = {
            focused = "bold",
            adapter_name = "bold",
          },
          telescope = {
            match = "bold",
          },
        },
        -- Override colors
        colors = {
          bg = "#141415",
          fg = "#cdcdcd",
          floatBorder = "#878787",
          line = "#252530",
          comment = "#606079",
          builtin = "#b4d4cf",
          func = "#c48282",
          string = "#e8b589",
          number = "#e0a363",
          property = "#c3c3d5",
          constant = "#aeaed1",
          parameter = "#bb9dbd",
          visual = "#333738",
          error = "#df6882",
          warning = "#f3be7c",
          hint = "#7e98e8",
          operator = "#90a0b5",
          keyword = "#6e94b2",
          type = "#9bb4bc",
          search = "#405065",
          plus = "#8cb66d",
          delta = "#f3be7c",
        },
      }
      vim.cmd "colorscheme vague"
      -- vim.cmd(":hi statusline guibg=NONE")
    end,
  },
  catppuccin = {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup {
        transparent_background = true,
        color_overrides = {
          mocha = {
            base = "#11111B",
          },
        },
      }
      vim.cmd.colorscheme "catppuccin"
    end,
  },
  nightfox = {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup {
        options = {
          transparent = true,
        },
      }
      vim.cmd.colorscheme "carbonfox"
    end,
  },
  everforest = {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup {
        -- Your config here
        transparent_background_level = 2,
      }
      vim.cmd.colorscheme "everforest"
    end,
  },
  tokyonight = {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup { transparent = true }
      vim.cmd.colorscheme "tokyonight-night"
    end,
  },
  rose_pine = {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup {
        disable_background = true,
        styles = {
          italic = false,
        },
        -- variant = "moon",
      }

      vim.cmd "colorscheme rose-pine-moon"
    end,
  },
  gruvbox_material = {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
      -- vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_float_style = "bright"
      vim.g.gruvbox_material_statusline_style = "material"
      vim.g.gruvbox_material_cursor = "auto"

      -- vim.g.gruvbox_material_colors_override = { bg0 = '#16181A' } -- #0e1010
      -- vim.g.gruvbox_material_better_performance = 1

      vim.cmd.colorscheme "gruvbox-material"
    end,
  },
  kanagawa = {
    "rebelot/kanagawa.nvim",
    build = ":KanagawaCompile",
    config = function()
      require("kanagawa").setup {
        transparent = true,
        ---@diagnostic disable-next-line: unused-local
        overrides = function(colors)
          return {
            ["@markup.link.url.markdown_inline"] = { link = "Special" }, -- (url)
            ["@markup.link.label.markdown_inline"] = { link = "WarningMsg" }, -- [label]
            ["@markup.italic.markdown_inline"] = { link = "Exception" }, -- *italic*
            ["@markup.raw.markdown_inline"] = { link = "String" }, -- `code`
            ["@markup.list.markdown"] = { link = "Function" }, -- + list
            ["@markup.quote.markdown"] = { link = "Error" }, -- > blockcode
            ["@markup.list.checked.markdown"] = { link = "WarningMsg" }, -- [x] checked list item
          }
        end,
      }
      vim.cmd.colorscheme "kanagawa-wave"
    end,
  },
}

local selected = colorschemes.onedark

return selected
