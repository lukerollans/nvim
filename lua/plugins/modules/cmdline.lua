return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    command_palette = true,
    cmdline = {
      format = {
        cmdline = { icon = "$" }
      }
    },
    lsp = {
      signature = {
        auto_open = {
          enabled = false,
        }
      }
    }
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim"
  }
}
