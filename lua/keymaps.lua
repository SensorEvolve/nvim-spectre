local vim = vim -- Ensure vim is referenced correctly

local wk = require("which-key")
local keymap = vim.keymap -- for conciseness

vim.g.mapleader = " "

---------------------
-- General Keymaps
---------------------
-- Yank to register a
keymap.set("n", "<leader>ya", '"ay', { noremap = true })

-- Delete without overwriting unnamed register
keymap.set("n", "<leader>d", '"_d', { noremap = true })

-- Paste from register a
keymap.set("n", "<leader>pa", '"ap', { noremap = true })

-- Move lines
keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>ss", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>te", "<cmd>tabnew<CR>", { desc = "Open new tab" })

keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
keymap.set("n", "<Leader>qq", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>qw", ":w<CR>", { desc = "Write" })

-- Terminal
keymap.set("n", "<Leader>tt", "<cmd>term<CR>", { noremap = true, silent = true })

-- Formatter/LSP
keymap.set("n", "<leader>af", vim.lsp.buf.format, { desc = "Format" })
keymap.set("n", "<leader>ak", vim.lsp.buf.hover, { desc = "Hover" })
keymap.set("n", "<leader>ac", vim.lsp.buf.definition, { desc = "Definition" })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
keymap.set("n", "<leader>aq", ":help keycodes<CR>", { desc = "Key Codes" })
keymap.set("n", "<leader>aD", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Buffer Diagnostics" })
keymap.set("n", "<leader>ad", vim.diagnostic.open_float, { desc = "Line diagnostics" })
keymap.set("n", "<leader>ar", ":LspRestart<CR>", { desc = "Restart LSP" })
keymap.set("n", "<leader>al", ":Lazy<CR>", { desc = "Lazy" })
keymap.set("n", "<leader>am", ":Mason<CR>", { desc = "Mason" })
keymap.set("n", "<leader>as", ":Startup<CR>", { desc = "Start" })

keymap.set("n", "<leader>cc", ":", { desc = "Cmdline" })
keymap.set("n", "<leader>cr", ":%s/", { desc = "Replace" })
keymap.set("n", "<leader>cC", ":help", { desc = "Help" })

-- Clear search highlights
keymap.set("n", "<leader>cl", ":nohl<CR>", { desc = "Clear search highlights" })

-- Start forward search
keymap.set("n", "<leader>cf", "/", { desc = "Start forward search" })

-- Visual mode: Shift + < to indent
keymap.set("v", "<S-<>", ">gv", { desc = "Indent selection" })

-- Undo tree toggle
keymap.set("n", "<F5>", ":UndotreeToggle<CR>", { noremap = true, silent = true })

-- Map a command to call the ChatGPT function
keymap.set("n", "<leader>cg", ':lua require("chatgpt").chatgpt()<CR>', { noremap = true, silent = true })

-- Reload Nvim
keymap.set("n", "<leader>cl", "<cmd>lua ReloadConfig()<CR>", { noremap = true, silent = false })

-- Set Tab keybinding for Neo-tree
keymap.set('n', '<Tab>', ':Neotree toggle<CR>', { noremap = true, silent = true })

