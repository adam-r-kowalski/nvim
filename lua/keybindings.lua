local map = vim.api.nvim_set_keymap

local options = {noremap=true, silent=true}

map("i", "jk", "<esc>", options)
map("t", "jk", "<c-\\><c-n>", options)
map("n", ";", ":", {noremap=true})
map("n", "<leader>f", "<cmd>lua require('telescope.builtin').find_files()<cr>", options)
map("n", "<leader>.", "<cmd>lua require('telescope.builtin').file_browser()<cr>", options)
map("n", "<leader>g", "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
map("n", "<leader>bl", "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
map("n", "<leader>bd", "<cmd>Bdelete<cr>", options)
map("n", "<leader>x", "<cmd>lua require('telescope.builtin').commands()<cr>", options)
map("n", "<leader>dl", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>", options)
map("n", "<leader>sf", "<cmd>luafile %<cr>", options)
map("n", "<leader>i", "<cmd>edit ~/AppData/Local/nvim/init.lua<cr>", options)
map("n", "<leader>e", ":NvimTreeFindFile<cr>", options)
map("n", "<leader>pi", "<cmd>PackerInstall<cr>", options)
map("n", "<leader>pc", "<cmd>PackerClean<cr>", options)
map("n", "gb", "<c-o>", options)
map("n", "gn", "<c-^>", options)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", options)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", options)
map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<cr>", options)
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", options)
map("n", "<c-h>", "<c-w>h", options)
map("n", "<c-j>", "<c-w>j", options)
map("n", "<c-k>", "<c-w>k", options)
map("n", "<c-l>", "<c-w>l", options)
map("n", "<leader>tn", "<cmd>TestNearest<cr>", options)
map("n", "<leader>tf", "<cmd>TestFile<cr>", options)
map("n", "<leader>tl", "<cmd>TestLast<cr>", options)
map("n", "<leader>tv", "<cmd>TestVisit<cr>", options)
map("n", "<leader>ts", "<cmd>TestSuite<cr>", options)
map("n", "<leader>td", "<cmd>TodoTelescope<cr>", options)
map("n", "<leader>y", "<cmd>lua require('terminal').compile_yeti:toggle()<cr>", options)
map("n", "<leader>cd", "<cmd>lua require('terminal').compile_compiler_debug:toggle()<cr>", options)
map("n", "<leader>cs", "<cmd>lua require('terminal').compile_compiler_release_safe:toggle()<cr>", options)
map("n", "<leader>cf", "<cmd>lua require('terminal').compile_compiler_release_fast:toggle()<cr>", options)
map("n", "<leader>cy", "<cmd>lua require('terminal').compile_yeti_window:toggle()<cr>", options)
map("n", "<leader>o", "<cmd>SymbolsOutline<cr>", options)
map("n", "<leader>v", "<cmd>lua require('terminal').lazygit:toggle()<cr>", options)
map("n", "s", "<Plug>(easymotion-s2)", {})
map("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", options)
map("n", "<s-tab>", "<cmd>BufferLineCyclePrev<CR>", options)
