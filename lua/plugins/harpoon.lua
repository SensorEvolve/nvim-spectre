return {
	"ThePrimeagen/harpoon",
	config = function()

		local harpoon_mappings = {
			h = {
				name = "Harpoon", -- This name will be displayed in the which-key popup
				x = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add File" },
				n = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Next Mark" },
				p = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Previous Mark" },
				m = { "<cmd>Telescope harpoon marks<CR>", "List Marks" },
				-- Add more mappings for Harpoon as needed
			},
			-- ... additional groupings or mappings ...
		}
		local wk = require("which-key")

		-- Register the Harpoon mappings under the leader key
		wk.register(harpoon_mappings, { prefix = "<leader>" })
	end,
}
