-- set up language server provider
return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = true, dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required

      { 'onsails/lspkind.nvim' },
      { 'b0o/schemastore.nvim' }
    },
    config = function()
      local lsp = require('lsp-zero').preset("recommended")

      lsp.ensure_installed({
        'tsserver',
        'eslint',
        'jsonls',
        'bashls',
        'vimls',
        'elixirls',
        -- 'rust_analyzer',
        -- 'gopls',
        -- 'lua_ls',
        -- 'intelephense',
      })

      -- set keymappings once attached
      lsp.on_attach(function(_, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
        vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { buffer = true })
      end)

      -- format buffers on save if they're attached to a language server
      lsp.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ['tsserver'] = { 'javascript', 'typescript', 'jsx', 'tsx' },
          ['elixirls'] = { 'elixir', 'eex' },
          -- ['lua_ls'] = { 'lua' },
          -- ['rust_analyzer'] = { 'rust' },
          -- ['gopls'] = { 'go' },
        }
      })

      -- tweak some basic preferences
      lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
          error = "E",
          warn = "W",
          hint = "H",
          info = "I",
        },
      })

      -- define how diagnostics manifest
      vim.diagnostic.config({
        underline = true,
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          source = "always",
          style = "minimal",
          border = "rounded",
          header = "",
          prefix = "",
        },
      })

      local lspconfig = require('lspconfig')

      -- configure TypeScript specific settings
      lspconfig.tsserver.setup {}

      -- configure Lua specific settings
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })

      -- configure JSON specific settings
      lspconfig.jsonls.setup({
        settings = {
          json = {
            schema = require('schemastore').json.schemas(),
            validate = { enable = true },
          }
        }
      })

      -- configure eslint specific settings
      require('lspconfig').eslint.setup({
        filestypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'svelte' },
        settings = {
          workingDirectory = { mode = 'auto' },
          format = { enable = true },
          lint = { enable = true },
        },
      })

      -- all configured, start 'er up
      lsp.setup()
    end
  },

  -- inlay hints
  {
    'simrat39/inlay-hints.nvim',
    config = function()
      require("inlay-hints").setup({
        only_current_line = false,
        eol = {
          right_align = false,
        }
      })
    end
  },

  -----------------------------------------
  -- language specific: Elixir           --
  -----------------------------------------
  -- elixir-tools
  {
    "elixir-tools/elixir-tools.nvim",
    lazy = false,
    enabled = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup {
        credo = {},
        elixirls = {
          enable = true,
          settings = elixirls.settings {
            dialyzerEnabled = false,
            enableTestLenses = false,
          },
          on_attach = function(client, bufnr)
            vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
            vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
          end,
        }
      }
    end,
  },
}

