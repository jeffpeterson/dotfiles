-- See `:h mapleader`
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase  = true

vim.o.wrap           = false
vim.o.cursorline     = true -- Highlight the line where the cursor is on.
vim.o.scrolloff      = 10 -- Keep this many screen lines above/below the cursor.
vim.o.list           = true -- Show <tab> and trailing spaces.
vim.o.number         = true -- Show line numbers
vim.o.relativenumber = true -- Show relative line numbers except current

-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s). See `:h 'confirm'`
vim.o.confirm = true

-- KEYMAPS
--
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set({'i'}, 'jk', '<esc>')
vim.keymap.set({'i'}, 'JK', '<esc>')
vim.keymap.set({'i'}, 'jK', '<esc>')
vim.keymap.set({'i'}, 'Jk', '<esc>')

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')

-- AUTOCOMMANDS (EVENT HANDLERS)
--
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- USER COMMANDS: DEFINE CUSTOM COMMANDS
--
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }):wait().stdout)
end, { desc = 'Print the git blame for the current line' })

-- PLUGINS
--
-- See `:h :packadd`, `:h vim.pack`

-- Add the "nohlsearch" package to automatically disable search highlighting after
-- 'updatetime' and when going to insert mode.
vim.cmd('packadd! nohlsearch')

-- Install third-party plugins via "vim.pack.add()".
vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',     -- Quickstart configs for LSP
  'https://github.com/ibhagwan/fzf-lua',          -- Fuzzy picker
  'https://github.com/nvim-mini/mini.completion', -- Autocompletion
  'https://github.com/nvim-mini/mini.align',      -- Alignment
  'https://github.com/stevearc/quicker.nvim',     -- Enhanced quickfix/loclist
  'https://github.com/lewis6991/gitsigns.nvim',   -- Git integration
  'https://github.com/neanias/everforest-nvim',   -- Color scheme
  'https://github.com/kylechui/nvim-surround',    -- Ex: cs"'
})

require('fzf-lua').setup { fzf_colors = true }
require('mini.completion').setup {}
require('mini.align').setup {}
require('quicker').setup {}
require('gitsigns').setup {}
require('everforest').load()
require('nvim-surround').setup {}
