-- do a bunch of useful stuff around language
-- servers. does not reside in lsp.lua as null-ls
-- augments the language servers rather than defining them

return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    priority = 1500,
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettierd, -- inject Prettier rules in to LSP formatting
        }
      })
    end
  },
}
