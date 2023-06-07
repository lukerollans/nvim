-- various formatting related plugins
return {
  {
    'lukas-reineke/indent-blankline.nvim', -- show indentation guides on blank lines
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  }
}
