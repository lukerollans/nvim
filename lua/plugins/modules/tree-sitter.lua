-- let's go tree-sitter!
return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup {
      auto_install = true,
      highlight = {
        enable = { 'elixir' },
        additional_vim_regex_highlighting = false,
      },
      ensure_installed = {
        'elixir',
      }
    }
  end
}
