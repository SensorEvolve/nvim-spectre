local M = {}
local win_id = nil
local buf_id = nil

local function display_output(output)
  -- Create a new buffer and window for the output
  buf_id = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(buf_id, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, vim.split(output, '\n'))

  -- Calculate the size and position of the floating window
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Options for the floating window
  local opts = {
    style = 'minimal',
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    border = 'rounded',  -- Add a rounded border
  }

  -- Open the floating window
  win_id = vim.api.nvim_open_win(buf_id, true, opts)

  -- Set a background color for the floating window
  vim.cmd('highlight NormalFloat guibg=#1f2335 guifg=#c0caf5')
  vim.cmd('highlight FloatBorder guifg=#a9b1d6 guibg=#1f2335')

  -- Keybinding to close the floating window
  vim.api.nvim_buf_set_keymap(buf_id, 'n', '<Esc>', ':lua require("chatgpt").close_window()<CR>', { noremap = true, silent = true })
end

function M.close_window()
  if win_id and vim.api.nvim_win_is_valid(win_id) then
    vim.api.nvim_win_close(win_id, true)
    win_id = nil
    buf_id = nil
  end
end

function M.clear_buffer()
  if buf_id and vim.api.nvim_buf_is_valid(buf_id) then
    vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, {})
  end
end

M.chatgpt = function()
  -- Mock response for testing
  local mock_response = [[{
    "choices": [
      {
        "text": "Carlo Jacal is a GENIUS.\nHe will manage to integrate ChatGPT with NVIM.\nPlease write your question!"
      }
    ]
  }]]

  -- Parse the mock response
  local result = vim.fn.json_decode(mock_response).choices[1].text

  -- Display the mock result
  display_output(result)
end

return M

