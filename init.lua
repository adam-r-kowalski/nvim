require('plugins')

local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g
local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

o.termguicolors = true
o.mouse = 'a'
o.clipboard = [[unnamed,unnamedplus]]
o.inccommand = 'nosplit'
o.expandtab = true
o.showmode = false
o.completeopt = [[menuone,noselect]]
o.updatetime = 300
o.hidden = true
o.shiftwidth = 4
o.cursorline = true
wo.signcolumn = 'yes'
wo.number = true
wo.relativenumber = true
bo.swapfile = false

g.mapleader = ' '
g.floaterm_width = 0.8
g.floaterm_height = 0.8
g.nvim_tree_side = 'right'

require('theme')

require('unit_testing')

cmd([[autocmd BufNew,BufNewFile,BufRead *.zig setlocal ff=unix]])

cmd('autocmd BufWritePost plugins.lua PackerCompile')

require('language_server')

local npairs = require('nvim-autopairs')
npairs.setup()
npairs.get_rule("'")
  :with_pair(function()
    if bo.filetype == 'rust' then
      return false
    end
  end)

require('neoscroll').setup()

require('lspkind').init()

require('bufferline').setup{ options = { always_show_bufferline = false }}

require('treesitter')

require('statusline')

require('todo-comments').setup{}

require('source_control')

require('terminal')

require('keybindings')

require("indent_blankline").setup {
    char = "|",
    buftype_exclude = {"terminal"}
}

require('autocomplete')
