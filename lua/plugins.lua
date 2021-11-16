local packer = require('packer')

local use = packer.use

return packer.startup(function()
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use 'nvim-treesitter/nvim-treesitter'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'tpope/vim-commentary'
  use 'vim-test/vim-test'
  use 'akinsho/toggleterm.nvim'
  use 'windwp/nvim-autopairs'
  use 'ziglang/zig.vim'
  use 'easymotion/vim-easymotion'
  use 'karb94/neoscroll.nvim'
  use "lukas-reineke/indent-blankline.nvim"
  use 'onsails/lspkind-nvim'
  use 'akinsho/nvim-bufferline.lua'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'simrat39/symbols-outline.nvim'
  use 'rhysd/vim.wasm'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use 'f-person/git-blame.nvim'
  use 'famiu/bufdelete.nvim'
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }
  use 'sindrets/diffview.nvim'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'rhysd/vim-wasm'
  use 'marko-cerovac/material.nvim'
end)
