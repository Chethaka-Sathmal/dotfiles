vim.g.netrw_banner = 0                -- Removed NetRW top banner

vim.opt.mouse = "a"                   -- enable mouse click (overrides previous mouse=v)

vim.opt.termguicolors = true          -- Enable true color support in the terminal

vim.opt.number = true                 -- add line numbers
vim.opt.relativenumber = true         -- Show line numbers relative to the cursor position

vim.opt.showmatch = true              -- show matching
vim.opt.ignorecase = true             -- case insensitive
vim.opt.hlsearch = true               -- highlight search
vim.opt.incsearch = true              -- incremental search

vim.opt.tabstop = 4                   -- number of columns occupied by a tab
vim.opt.softtabstop = 4               -- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true              -- converts tabs to white space
vim.opt.shiftwidth = 4                -- width for autoindents
vim.opt.autoindent = true             -- indent a new line the same amount as the line just typed

vim.opt.wildmode = "longest,list"     -- get bash-like tab completions
vim.opt.clipboard = "unnamedplus"     -- using system clipboard
vim.opt.ttyfast = true                -- Speed up scrolling in Vim
-- vim.opt.spell = true               -- enable spell check (may need to download language package)

vim.opt.swapfile = false              -- disable creating swap file
vim.opt.backup = false
vim.opt.undoidr = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

-- vim.opt.backupdir = "~/.cache/vim"    -- Directory to store backup files.

vim.opt.wrap = false                  -- Disable wrapping by default
vim.opt.smartindent = true
vimt.opt.inccommand = "split"

vim.opt.splitright = true             -- Vertical splits open to the right
vim.opt.splitbelow = true             -- Horizontal splits open to below
vim.opt.list = true                   -- Enable the list mode (shows the hidden characters)
vim.opt.listchars = {
  space = '·',
}
vim.opt.smartcase = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = true
