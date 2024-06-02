return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
  },
  config = function()
    require("neogit").setup({})
    require("which-key").register({
      ["<leader>v"] = { "<cmd>Neogit<cr>", "neogit" },
    })
  end
}
