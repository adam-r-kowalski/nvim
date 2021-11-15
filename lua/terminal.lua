require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'curved',
    width = math.floor(vim.o.columns * 0.95),
    height = math.floor(vim.o.columns * 0.9),
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

local Terminal = require("toggleterm.terminal").Terminal

local M = {}

M.lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "window",
})

M.compile_compiler_debug = Terminal:new({
  shell = 'nu',
  cmd = "cd /Users/adamk/code/compiler && zig build",
  close_on_exit = false,
})

M.compile_compiler_release_safe = Terminal:new({
  shell = 'nu',
  cmd = "cd /Users/adamk/code/compiler && zig build -Drelease-safe",
  close_on_exit = false,
})

M.compile_compiler_release_fast = Terminal:new({
  shell = 'nu',
  cmd = "cd /Users/adamk/code/compiler && zig build -Drelease-fast",
  close_on_exit = false,
})

M.compile_yeti = Terminal:new({
  shell = 'nu',
  cmd = "cd /Users/adamk/code/compiler/temp && /Users/adamk/code/compiler/zig-out/bin/compiler.exe demo.yeti demo.wat && wasmtime demo.wat",
  close_on_exit = false,
})

M.compile_yeti_window = Terminal:new({
  shell = 'nu',
  cmd = "cd /Users/adamk/code/compiler/temp && /Users/adamk/code/compiler/zig-out/bin/compiler.exe demo.yeti demo.wat && wasmtime demo.wat",
  close_on_exit = false,
  direction = "window",
})

return M
