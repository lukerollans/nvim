-- define statusline plugin
return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  lazy = false,
  event = { "BufReadPost", "BufNewFile", "VeryLazy" },
  config = function()
    local colors = require('config.colours').colors
    require("lualine").setup {
      options = {
        theme = {
          normal = {
            a = { fg = colors.bg, bg = colors.fg },
            b = { fg = colors.fg, bg = colors.bg },
            c = { fg = colors.fg, bg = colors.bg },
            z = { fg = colors.fg, bg = colors.bg }
          },
          insert = {
            a = colors.macchiato.pink,
            b = { fg = colors.fg, bg = colors.bg },
            z = { fg = colors.fg, bg = colors.bg }
          },
          visual = {
            a = colors.macchiato.peach,
            b = { fg = colors.fg, bg = colors.bg },
            z = { fg = colors.fg, bg = colors.bg }
          },
          command = {
            a = colors.macchiato.blue,
            b = { fg = colors.fg, bg = colors.bg },
            z = { fg = colors.fg, bg = colors.bg }
          },
          replace = {
            a = { fg = colors.fg, bg = colors.bg },
            b = { fg = colors.fg, bg = colors.bg }
          },
          inactive = {
            a = { bg = colors.bg, fg = colors.fg },
            b = { bg = colors.bg, fg = colors.fg },
            c = { bg = colors.bg, fg = colors.fg }
          },
        },
        icons_enabled = true,
        section_separators = "",
        component_separators = "",
        disabled_filetypes = {
          statusline = {
            'help',
            'startify',
            'dashboard',
            'neo-tree',
            'packer',
            'neogitstatus',
            'NvimTree',
            'Trouble',
            'alpha',
            'lir',
            'Outline',
            'spectre_panel',
            'toggleterm',
            'qf',
          },
          winbar = {},
        },
      },
      sections = {
        lualine_a = {
          "mode"
        },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "filetype",
            icon_only = true,
            separator = "",
            padding = {
              left = 0, right = 0
            }
          },
          {
            "filename",
            path = 1,
            symbols = {
              modified = "  ",
              readonly = "",
              unnamed = ""
            }
          },
          { "diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " " } },
        },
        lualine_x = { "encoding" },
        lualine_y = { "progress" }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
            path = 0,
          }
        },
        lualine_x = { "location" },
        lualine_y = {}
      },
      tabline = {},
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
