local cmd = vim.cmd

cmd([[
let g:test#custom_runners = {'zig': ['Zigtest']}
let test#python#runner = 'pytest'
let test#python#pytest#executable = 'python -m pytest'
let test#python#pytest#options = '-s'

let test#rust#cargotest#options = '-- --nocapture --color always'
let test#strategy = 'neovim'
let test#neovim#term_position = "vert"
]])
