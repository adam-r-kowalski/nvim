return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  keys = { { "-", "<cmd>Oil<cr>", desc = "oil" } },
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true
    }
  }
}

