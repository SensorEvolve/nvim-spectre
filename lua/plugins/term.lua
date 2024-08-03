return {
    "akinsho/toggleterm.nvim",  -- Assuming it's the one by akinsho
    config = function()
        require("toggleterm").setup({
            close_on_exit = false,
            autochdir = true,  -- Correct usage of boolean value
            shell = vim.o.shell,
            size = 20
        })

        function _G.set_terminal_keymaps()
            local opts = { noremap = true }
            vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
            vim.api.nvim_buf_set_keymap(0, 't', '<C-esc>', [[<C-\><C-n><C-W>k]], opts)
        end
        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end
}

