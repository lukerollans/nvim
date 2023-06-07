-- configure language servers
return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    { 'j-hui/fidget.nvim', opts = {} },
    'williamboman/mason-lspconfig.nvim',
    'folke/neodev.nvim',
  },
}
