-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here




-- XML Formatting with xmlstarlet on selected text
vim.api.nvim_set_keymap('v', '<leader>xf', ":'<,'>!xmlstarlet fo<CR>", { noremap = true, silent = true })

-- JSON Formatting with prettier on selected text
vim.api.nvim_set_keymap('v', '<leader>jf', ":'<,'>!prettier --parser json<CR>", { noremap = true, silent = true })

-- URL Encoding using jq on the selected text
vim.api.nvim_set_keymap('v', '<leader>ue', ":'<,'>!jq -sRr @uri<CR>", { noremap = true, silent = true })

-- URL Decoding using Python's urllib.parse.unquote on the selected text
vim.api.nvim_set_keymap('v', '<leader>ud', ":'<,'>!python3 -c 'import urllib.parse, sys; print(urllib.parse.unquote(sys.stdin.read().strip()))'<CR>", { noremap = true, silent = true })


vim.keymap.set('n', 'date', function()
  local date = os.date('%Y-%m-%d %H:%M:%S')  -- Customize format if needed
  vim.api.nvim_put({date}, 'c', true, true)
end, { desc = 'Insert current date' })

vim.keymap.set('n', 'code', function()
  vim.api.nvim_put({'```'}, 'l', true, true)
end, { desc = 'Insert markdown code block delimiter' })
