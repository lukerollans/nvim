-- let's go tree-sitter!
return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup {
      auto_install = true,
      ensure_installed = {
        'bash',
        'html',
        'json',
        'lua',
        'markdown',
        'tsx',
        'typescript',
        'elixir',
        'yaml',
      }
    }
  end
}
