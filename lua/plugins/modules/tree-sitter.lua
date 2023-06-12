-- let's go tree-sitter!
return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup {
      auto_install = true,
      highlight = {
        disable = { 'yaml' },
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      ensure_installed = {
        'bash',
        'html',
        'json',
        'lua',
        'markdown',
        'tsx',
        'typescript',
        'elixir',
        'eex',
        'yaml',
      }
    }
  end
}
