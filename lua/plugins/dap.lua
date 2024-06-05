return {
  "mfussenegger/nvim-dap",
  dependencies = {
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

    local python_path
    if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
      python_path = table.concat({
        vim.fn.stdpath('data'),
        'mason',
        'packages',
        'debugpy',
        'venv',
        'Scripts',
        'python.exe'
      }, '\\')
    else
      python_path = table.concat({
        vim.fn.stdpath('data'),
        'mason',
        'packages',
        'debugpy',
        'venv',
        'bin',
        'python'
      }, '/')
    end

    dap.adapters.python = {
      type = 'executable',
      command = python_path,
      args = { '-m', 'debugpy.adapter' },
    }

    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        pythonPath = function()
          if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
            return vim.fn.getcwd() .. '\\.venv\\Scripts\\python.exe'
          else
            return vim.fn.getcwd() .. '/.venv/bin/python'
          end
        end,
      },
    }

    vim.fn.sign_define('DapBreakpoint', {text='•', texthl='', linehl='', numhl=''})
  end
}
