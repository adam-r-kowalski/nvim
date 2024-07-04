return {
  'Vigemus/iron.nvim',
  config = function()
    local iron = require("iron.core")
    iron.setup({
      config = {
        scratch_repl = true,
        repl_open_cmd = "vnew",
        repl_definition = {
          julia = {
            command = {
              "julia",
              "--project",
              "-e",
              [[Base.Filesystem.cd("src")]],
              "-i"
            }
          }
        }
      },
      highlight = {
        italic = true
      },
      ignore_blank_lines = true
    })

    _G.iron_send_operator = function(motion_type)
      local saved_register = vim.fn.getreg('"')
      local saved_register_type = vim.fn.getregtype('"')

      if motion_type == 'line' then
        vim.cmd('normal! `[V`]y')
      elseif motion_type == 'char' then
        vim.cmd('normal! `[v`]y')
      else
        return
      end

      local yanked_text = vim.fn.getreg('"')
      iron.send('julia', yanked_text)
      vim.fn.setreg('"', saved_register, saved_register_type)
    end

    local function setup_send_operator()
      vim.o.operatorfunc = 'v:lua.iron_send_operator'
      return 'g@'
    end

    require("which-key").register({
      S = { 
        function()
          iron.send_line()
        end, 
        "send line" 
      },
      s = { 
        function() 
          return setup_send_operator()
        end, 
        "send operator" 
      },
    }, { mode = "n", expr = true })

    require("which-key").register({
      s = { 
        function()
          iron.visual_send()
        end, 
        "send" 
      },
    }, { mode = "v" })
  end
}
