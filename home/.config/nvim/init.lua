-- vim:foldmethod=marker

-- OPTIONS {{{
-- :h option-list
--
-- See `:h mapleader`
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase  = true

vim.o.tabstop    = 2
vim.o.shiftwidth = 2
vim.o.expandtab  = true

vim.o.wrap           = false
vim.o.cursorline     = true -- Highlight the line where the cursor is on.
vim.o.scrolloff      = 10 -- Keep this many screen lines above/below the cursor.
vim.o.list           = true -- Show <tab> and trailing spaces.
vim.o.number         = true -- Show line numbers
vim.o.relativenumber = true -- Show relative line numbers except current

-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s). See `:h 'confirm'`
vim.o.confirm = true
-- }}}

-- KEYMAPS {{{
--
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set({'i', 't'}, 'jk', '<Esc>')
vim.keymap.set({'i', 't'}, 'JK', '<Esc>')
vim.keymap.set({'i', 't'}, 'jK', '<Esc>')
vim.keymap.set({'i', 't'}, 'Jk', '<Esc>')

vim.keymap.set('n', '<C-p>', ':FzfLua files<CR>')
--
-- }}}

-- AUTOCOMMANDS (EVENT HANDLERS) {{{
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

-- }}}

-- USER COMMANDS: DEFINE CUSTOM COMMANDS {{{
--
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }):wait().stdout)
end, { desc = 'Print the git blame for the current line' })

-- }}}

-- PLUGINS {{{
--
-- See `:h :packadd`, `:h vim.pack`

-- Add the "nohlsearch" package to automatically disable search highlighting after
-- 'updatetime' and when going to insert mode.
vim.cmd('packadd! nohlsearch')

-- Install third-party plugins via "vim.pack.add()".
vim.pack.add {
  'https://github.com/MunifTanjim/nui.nvim',          -- UI component library
  'https://github.com/nvim-lua/plenary.nvim',         -- Lua helpers
  'https://github.com/nvim-tree/nvim-web-devicons',   -- Nerd Font icon support

  'https://github.com/tpope/vim-sleuth',

  'https://github.com/ibhagwan/fzf-lua',           -- Fuzzy picker
  -- 'https://github.com/nvim-telescope/telescope.nvim', -- Fuzzy picker

  'https://github.com/nvim-neo-tree/neo-tree.nvim',   -- File explorer
  'https://github.com/neovim/nvim-lspconfig',     -- Quickstart configs for LSP
  'https://github.com/nvim-mini/mini.align',      -- Alignment. Ex: vip ga=
  'https://github.com/nvim-mini/mini.completion', -- Autocompletion
  -- 'https://github.com/nvim-mini/mini.sessions',   -- Session management
  -- 'https://github.com/nvim-mini/mini.starter',    -- Start screen
  'https://github.com/rmagatti/auto-session',
  'https://github.com/stevearc/quicker.nvim',     -- Enhanced quickfix/loclist
  'https://github.com/lewis6991/gitsigns.nvim',   -- Git integration
  'https://github.com/neanias/everforest-nvim',   -- Color scheme
  'https://github.com/kylechui/nvim-surround',    -- Quote wrapping. Ex: cs"'
}

-- require('fzf-lua').setup { fzf_colors = true }
require('neo-tree').setup {
  -- close_if_last_window = true,
  filesystem = {
    bind_to_cwd = true,
    use_libuv_file_watcher = true,
    follow_current_file = {
      enabled = true
    },
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
    }
  }
}
vim.api.nvim_create_autocmd("VimEnter", {
  callback = vim.schedule_wrap(function()
    vim.cmd("Neotree show")
  end),
})
require('auto-session').setup {
  cwd_change_handling = true
}
require('fzf-lua').setup {}
require('mini.completion').setup {}
require('mini.align').setup {}
require('quicker').setup {}
require('gitsigns').setup {
  current_line_blame = false
}
require('everforest').load()
require('nvim-surround').setup {}

-- }}}
