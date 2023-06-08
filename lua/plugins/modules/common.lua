-- miscellaneous plugins that dont require their own module given config
-- is minimal or non-existent
return {
  'tpope/vim-rhubarb',
  'tpope/vim-fugitive',
  'tpope/vim-sleuth',
  'tpope/vim-surround',
  'folke/which-key.nvim',
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end
  },
}
