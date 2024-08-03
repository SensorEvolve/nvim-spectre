return {
  "tiagovla/tokyodark.nvim",
  config = function()
    -- Import your custom palette
  local custom_palette = require("palette")

    -- Setup TokyoDark with the custom palette
    require("tokyodark").setup({
      transparent_background = true,
      gamma = 1.00,
      -- ... other configuration options
    	custom_palette = function(palette)
      -- Override the default palette with your custom palette
      for color, value in pairs(custom_palette) do
      palette[color] = value
      end
      return palette
      	end,
      -- ... other configuration options
    })

    -- Activate the color scheme
    vim.cmd.colorscheme("tokyodark")
  end,
}
