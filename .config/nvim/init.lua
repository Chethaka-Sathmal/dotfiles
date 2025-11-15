--  _   _                 _
-- | \ | | ___  _____   _(_)_ __ ___
-- |  \| |/ _ \/ _ \ \ / / | '_ ` _ \
-- | |\  |  __/ (_) \ V /| | | | | | |
-- |_| \_|\___|\___/ \_/ |_|_| |_| |_|
-- -----------------------------------------------------

-- disable compatibility to old-time vi (not needed in Neovim, but kept for reference)
-- set nocompatible

vim.opt.showmatch = true              -- show matching
vim.opt.ignorecase = true             -- case insensitive
vim.opt.mouse = "a"                   -- enable mouse click (overrides previous mouse=v)
vim.opt.hlsearch = true               -- highlight search
vim.opt.incsearch = true              -- incremental search
vim.opt.tabstop = 4                   -- number of columns occupied by a tab
vim.opt.softtabstop = 4               -- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true              -- converts tabs to white space
vim.opt.shiftwidth = 4                -- width for autoindents
vim.opt.autoindent = true             -- indent a new line the same amount as the line just typed
vim.opt.number = true                 -- add line numbers
vim.opt.wildmode = "longest,list"     -- get bash-like tab completions
vim.cmd("filetype plugin indent on")  -- allow auto-indenting depending on file type
vim.cmd("syntax on")                  -- syntax highlighting
vim.opt.clipboard = "unnamedplus"     -- using system clipboard
vim.cmd("filetype plugin on")
-- vim.opt.cursorline = true          -- highlight current cursorline
vim.opt.ttyfast = true                -- Speed up scrolling in Vim
-- vim.opt.spell = true               -- enable spell check (may need to download language package)
-- vim.opt.swapfile = false           -- disable creating swap file
-- vim.opt.backupdir = "~/.cache/vim" -- Directory to store backup files.
vim.opt.wrap = false                  -- Disable wrapping by default

-- Highlight groups
vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", fg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE", fg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", fg = "NONE" })
vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE", fg = "NONE" })
