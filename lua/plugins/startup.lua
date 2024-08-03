return {
"startup-nvim/startup.nvim",
  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    options = {
      mapping_keys = false,
  },

  config = function()
    require"startup".setup({theme = "evil"})
  end
}
