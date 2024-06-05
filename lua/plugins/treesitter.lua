return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { 'python', 'lua', 'javascript', 'rust', 'html', 'css' },
      highlight = {
        enable = true
      }
    })
  end
}
