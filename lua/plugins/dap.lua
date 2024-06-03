return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim"
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    dap.listeners.before.attach.dapui_config = dapui.open
    dap.listeners.before.launch.dapui_config = dapui.open
    dap.listeners.before.event_terminated.dapui_config = dapui.close
    dap.listeners.before.event_exited.dapui_config = dapui.close

    require("dapui").setup()

    require("mason-nvim-dap").setup {
      ensure_installed = { "python" }
    }

    local python_path = table.concat({
      vim.fn.stdpath('data'),
      'mason',
      'packages',
      'debugpy',
      'venv',
      'Scripts',
      'python.exe'
    }, '/'):gsub('//+', '/')
    require('dap-python').setup(python_path)

    vim.fn.sign_define('DapBreakpoint', {text='•', texthl='', linehl='', numhl=''})
  end
}
