local opt = vim.opt -- for conciseness, install the extension
opt.mouse = 'v'

local vim = vim

vim.o.fileencoding = 'utf-8'

-- Simplified cursor configuration with colors
vim.o.guicursor = 'n-v-c:block-Cursor,i:ver50-CursorInsert'

-- Set cursor color for different modes
vim.cmd [[highlight Cursor guifg=NONE guibg=#FF0800]]      -- Normal mode cursor color
vim.cmd [[highlight CursorInsert guifg=NONE guibg=#00FF00]] -- Insert mode cursor color

-- Link the cursor highlight groups
vim.cmd [[
augroup my_cursor
  autocmd!
  autocmd InsertEnter * hi Cursor guifg=NONE guibg=#00FF00
  autocmd InsertLeave * hi Cursor guifg=NONE guibg=#FF0800
augroup END
]]

vim.o.winbar = '%=%m\\ %f'

-- line numbeirs
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.smartindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
--opt.cursorline = true -- highlight the current cursor line

--Error sign to the left
vim.opt.signcolumn = "yes"

-- appearance
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

--Vimwiki
vim.cmd [[
  filetype plugin on
  syntax on
]]

-- Vimwiki home folder
vim.g.vimwiki_list = {{
  path = '~/.config/nvim/vimwiki/',
  syntax = 'markdown',
  ext = '.md'
}}

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})


