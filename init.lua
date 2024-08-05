local vim = vim
vim.g.mapleader = " "
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

require('keymaps')
require('options')
require('palette')
require('lualinetheme')
require('chatgpt')
require('image')

-- Source the Vimwiki configuration
local vimwiki = require('vimwiki')
vimwiki.setup()

-- Set Tab keybinding for Neo-tree
vim.api.nvim_set_keymap('n', '<Tab>', ':Neotree toggle<CR>', { noremap = true, silent = true })

-- Ensure the Tab key is always mapped to Neo-tree, even after Vimwiki settings
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("Neotree toggle")
    vim.api.nvim_set_keymap('n', '<Tab>', ':Neotree toggle<CR>', { noremap = true, silent = true })
  end
})

--Chatgpt
vim.g.openai_api_key = os.getenv("OPENAI_API_KEY")


