-- configure how the statusline looks and behaves
return {
  'nvim-lualine/lualine.nvim', -- use lualine!
  opts = {
    options = {
      component_separators = '|',
      section_separators = '',
    },
  },
}
