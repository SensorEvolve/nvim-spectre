return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x", -- use "main" to track the latest version automatically
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, for file icons
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
                },
            },
            renderers = {
                file = {
                    { "icon" },
                    { "name" },
                },
                directory = {
                    { "icon" },
                    { "name" },
                },
            },
            icon = {
                folder_closed = "📁",
                folder_open = "📂",
                folder_empty = "💸",
                -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                -- then these will never be used.
                default = "*",
                highlight = "NeoTreeFileIcon",
            },
            modified = {
                symbol = "[🔧]",
                highlight = "NeoTreeModified",
            },
            name = {
                trailing_slash = false,
                use_git_status_colors = true,
                highlight = "NeoTreeFileName",
            },
            git_status = {
                symbols = {
                    -- Change type
                    added = "➕", -- or "✚", but this is redundant info if you use git_status_colors on the name
                    modified = "🔧", -- or "", but this is redundant info if you use git_status_colors on the name
                    deleted = "❌", -- this can only be used in the git_status source
                    renamed = "📝", -- this can only be used in the git_status source
                    -- Status type
                    untracked = "🚧",
                    ignored = "🤷",
                    unstaged = "🚪",
                    staged = "🎬",
                    conflict = "🪖",
                },
            },
        })

        -- If you want icons for diagnostic errors, you'll need to define them somewhere:
        vim.fn.sign_define("DiagnosticSignError", {text = "💥", texthl = "DiagnosticSignError"})
        vim.fn.sign_define("DiagnosticSignWarn", {text = "🧨", texthl = "DiagnosticSignWarn"})
        vim.fn.sign_define("DiagnosticSignInfo", {text = "🦜", texthl = "DiagnosticSignInfo"})
        vim.fn.sign_define("DiagnosticSignHint", {text = "🤔", texthl = "DiagnosticSignHint"})

        -- Set keymaps
        local keymap = vim.keymap -- for conciseness
        keymap.set("n", "<Tab>", ":Neotree toggle<CR>", { noremap = true, silent = true })
    end,
}

