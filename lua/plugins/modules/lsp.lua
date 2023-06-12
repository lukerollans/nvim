-- set up language server provider
return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    { 'j-hui/fidget.nvim', version = 'legacy' },
    'folke/neodev.nvim',
  },
}
