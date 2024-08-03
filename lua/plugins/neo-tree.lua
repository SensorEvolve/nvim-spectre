return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x", -- or the branch/version you prefer
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-web-devicons", -- optional, for file icons
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			window = {
				position = "left",
				width = 28,
				mapping_options = {
					noremap = true,
					nowait = true,
				}, -- Your configuration here
			},
		})
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<Tab>", ":Neotree toggle<CR>", { noremap = true, silent = true })
	end,
}
