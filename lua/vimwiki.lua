-- ~/.config/nvim/lua/vimwiki.lua

local M = {}

function M.setup()
  -- Ensure Vimwiki is installed and configured
  vim.g.vimwiki_list = {{ path = '~/vimwiki/', syntax = 'markdown', ext = '.md' }}
  vim.g.vimwiki_markdown_link_ext = 1
  vim.g.vimwiki_table_mappings = 0

  -- Customize Vimwiki keybindings to use Enter for list operations
  vim.g.vimwiki_key_mappings = {
      all_maps = 1,
      global = 0,
      headers = 1,
      text_objs = 1,
      table_format = 1,
      table_mappings = 0,
      lists = 1,
      links = 1,
      html = 1,
      mouse = 0,
      maps = {
          list = {
              new_list_item = '<CR>',
              indent = '<CR>',
              dedent = '<S-CR>'
          }
      }
  }

  -- Set custom keybindings for Vimwiki
  vim.api.nvim_set_keymap('n', '<Leader>ww', '<Plug>VimwikiIndex', {})
  vim.api.nvim_set_keymap('n', '<Leader>wt', '<Plug>VimwikiTabIndex', {})
  vim.api.nvim_set_keymap('n', '<Leader>ws', '<Plug>VimwikiUISelect', {})
  vim.api.nvim_set_keymap('n', '<Leader>wd', '<Plug>VimwikiDiaryIndex', {})
  vim.api.nvim_set_keymap('n', '<Leader>w<Leader>w', '<Plug>VimwikiMakeDiaryNote', {})
  vim.api.nvim_set_keymap('n', '<Leader>w<Leader>t', '<Plug>VimwikiMakeTodayDiaryNote', {})
  vim.api.nvim_set_keymap('n', '<Leader>w<Leader>y', '<Plug>VimwikiMakeYesterdayDiaryNote', {})
  vim.api.nvim_set_keymap('n', '<Leader>w<Leader>m', '<Plug>VimwikiMakeTomorrowDiaryNote', {})

  -- Unmap Tab key in Vimwiki buffers
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "vimwiki",
    callback = function()
      vim.api.nvim_buf_set_keymap(0, 'n', '<Tab>', '<Nop>', { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, 'i', '<Tab>', '<Nop>', { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, 'v', '<Tab>', '<Nop>', { noremap = true, silent = true })
    end
  })

  -- Autocommand to set filetype and syntax for Vimwiki markdown files
  vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"~/vimwiki/*.md"},
    callback = function()
      vim.bo.filetype = "vimwiki"
      vim.bo.syntax = "markdown"
    end
  })

  -- Function to open the correct Vimwiki page and insert an image reference
  local function open_correct_vimwiki_with_image()
    -- Correct path to the Vimwiki index.md and the image
    local vimwiki_page = vim.fn.expand("~/vimwiki/index.md")
    local image_path = vim.fn.expand("~/Pictures/spectre_nvim3.png")
    local image_reference = "![" .. "Spectre Image" .. "](" .. image_path .. ")"

    -- Ensure the Vimwiki directory and file exist
    os.execute("mkdir -p ~/vimwiki")
    if vim.fn.filereadable(vimwiki_page) == 0 then
      os.execute("touch " .. vimwiki_page)
    end

    -- Open the correct Vimwiki page
    vim.cmd("edit " .. vimwiki_page)

    -- Set filetype and syntax for Vimwiki
    vim.bo.filetype = "vimwiki"
    vim.bo.syntax = "markdown"

    -- Check if the image reference already exists
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local image_exists = false
    for _, line in ipairs(lines) do
      if line == image_reference then
        image_exists = true
        break
      end
    end

    -- Insert the image reference if it doesn't exist
    if not image_exists then
      vim.cmd("normal! Go")
      vim.cmd("normal! Go" .. image_reference)
      vim.cmd("write")
    end

    -- Refresh the buffer to render the images
    vim.cmd("checktime")
  end

  -- Set up an autocommand to open the correct Vimwiki page with an image on VimEnter
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      open_correct_vimwiki_with_image()
    end
  })
end

return M

