return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				layout_strategy = "vertical",
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})
		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		local wk = require("which-key")

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
--  keymap.set("n", "<leader>fw", "/<CR>", {desc = "Search Word"})

		local telescope_mappings = {
			name = "Telescope", -- This will be displayed as the group name in the popup
			f = { "<cmd>Telescope find_files<cr>", "Find File" },
			o = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
			s = { "<cmd>Telescope live_grep<cr>", "Search String" },
			g = { "<cmd>Telescope grep_string<cr>", "Search Under Cursor" },
			-- Add more Telescope mappings here
		}

		local wk = require("which-key")

		-- Register the Telescope mappings under the leader key
		wk.register({
			f = telescope_mappings,
		}, { prefix = "<leader>" })
	end,
}
