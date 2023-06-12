-- add some Elixir language conveniences
return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local map = vim.keymap.set

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
          map("n", "<leader>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          map("n", "<leader>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          map("v", "<leader>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
        end,
      }
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
