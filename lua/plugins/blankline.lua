-- Plugin setup entry for your Neovim plugin manager
return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup()
	end,
}
