-- various formatting related plugins

-- helper which directs formatter plugin to invoke prettier
function prettier()
  return {
    exe = "npx",
    args = {"prettier", "--stdin-filepath", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

return {
  {
    'lukas-reineke/indent-blankline.nvim', -- show indentation guides on blank lines
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },
  {
    'mhartington/formatter.nvim', -- apply formatting to certain file types
    config = function()
      require('formatter').setup {
        logging = true,
        filetype = {
          typescriptreact = { prettier },
          typescript = { prettier },
          javascript = { prettier },
          javascriptreact = { prettier },
          json = { prettier },
        }
      }
    end
  }
}
