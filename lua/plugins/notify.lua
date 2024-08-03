return {
    'rcarriga/nvim-notify',

    config = function()
        require("notify").setup {
            stages = 'fade_in_slide_out',
            background_colour = 'FloatShadow',
            timeout = 8000,
            termguicolors = true
        }
        vim.notify = require('notify')
        local notify = require 'notify'
        vim.lsp.handlers['window/showMessage'] = function(_, result, ctx)
            local client = vim.lsp.get_client_by_id(ctx.client_id)
            local lvl = ({
                'ERROR',
                'WARN',
                'INFO',
                'DEBUG',
            })[result.type]
            notify({ result.message }, lvl, {
                title = 'LSP | ' .. client.name,
                timeout = 10000,
                keep = function()
                    return lvl == 'ERROR' or lvl == 'WARN'
                end, -- Closing the function for 'keep'
            }) -- Closing the table passed to notify
        end -- Closing the function for window/showMessage
    end -- Closing the config function
} -- Closing the return table
