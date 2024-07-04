return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup({})
    require("which-key").register({
      ["<leader>v"] = { "<cmd>Neogit<cr>", "neogit" }
    })
  end
}
