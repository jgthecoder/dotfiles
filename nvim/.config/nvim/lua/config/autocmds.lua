-- Don't auto insert comment leader on new line
vim.api.nvim_create_autocmd('BufEnter', { command = [[set formatoptions-=cro]] })

local augroup = vim.api.nvim_create_augroup('custom-augroup', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'help', 'man' },
  group = augroup,
  desc = 'Use q to close the window',
  command = 'nnoremap <buffer> q <cmd>quit<cr>',
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Start in insert mode in terminal mode
vim.cmd [[autocmd TermOpen term://* startinsert]]
