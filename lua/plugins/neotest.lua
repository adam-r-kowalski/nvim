return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require("neotest-python")({
          runner = "pytest"
        })
      }
    }

    local test_file = function()
      require("neotest").run.run(vim.fn.expand("%"))
    end

    local debug_nearest = function()
      require("neotest").run.run({ strategy = "dap" })
    end


    require("which-key").register({
      n = { require("neotest").run.run, "nearest" },
      f = { test_file, "file" },
    }, { prefix = "<leader>t", name = "test" })

    require("which-key").register({
      n = { debug_nearest, "nearest" },
      b = { require'dap'.toggle_breakpoint, "toggle breakpoint" },
    }, { prefix = "<leader>d", name = "debug" })

    require("which-key").register({
      ["<leader>e"] = { require'dapui'.eval, "eval" },
    }, { mode = "v" })

    require("which-key").register({
      ["<f1>"] = { require'dap'.continue, "continue" },
      ["<f2>"] = { require'dap'.step_into, "step into" },
      ["<f3>"] = { require'dap'.step_over, "step over" },
      ["<f4>"] = { require'dap'.step_out, "step out" },
      ["<f5>"] = { require'dap'.restart, "restart" },
      ["<f6>"] = { require'dap'.terminate, "terminate" },
      ["<f7>"] = { require'dap'.disconnect, "disconnect" },
    })
  end
}
