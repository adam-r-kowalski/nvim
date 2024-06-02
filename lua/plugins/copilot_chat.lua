return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("CopilotChat").setup({})
      require("which-key").register({
        c = { "<cmd>CopilotChatToggle<cr>", "toggle" },
        r = { "<cmd>CopilotChatReset<cr>", "reset" },
      }, { prefix = "<leader>c", name="copilot" })
      require("which-key").register({
        e = { "<cmd>CopilotChatExplain<cr>", "explain" },
        r = { "<cmd>CopilotChatReview<cr>", "review" },
        f = { "<cmd>CopilotChatFix<cr>", "fix" },
        o = { "<cmd>CopilotChatOptimize<cr>", "optimize" },
        d = { "<cmd>CopilotChatDocs<cr>", "docs" },
        t = { "<cmd>CopilotChatTest<cr>", "test" },
        x = { "<cmd>CopilotChatDiagnostic<cr>", "diagnostic" },
        g = { "<cmd>CopilotChatCommit<cr>", "commit" },
      }, { prefix = "<leader>c", name="copilot", mode="v" })
    end
  },
}
