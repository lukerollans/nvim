return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    command_palette = true,
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
