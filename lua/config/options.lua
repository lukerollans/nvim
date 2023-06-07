local options = {
  hlsearch = true, -- use highlighting on search
  number = true, -- always show line numbers
  clipboard = 'unnamedplus', -- sync clipboard between neovim and macOS
  breakindent = true, -- enable break indent
  undofile = true, -- keep undo history
  ignorecase = true, -- case insensitive search
  smartcase = true, -- case insensitive search
  signcolumn = 'yes', -- keep signcolumn on by defaul
  updatetime = 250, -- decrease update time
  timeout = true, -- decrease update time
  timeoutlen = 300, -- decrease update time
  completeopt = 'menuone,noselect', -- better completeopt experience
  termguicolors = true, -- use gui colours where possible
}

for key, value of options do
  vim.o[key] = value
end
