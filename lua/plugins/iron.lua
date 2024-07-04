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

    local function send_tree_sitter_block()
      local ts_utils = require('nvim-treesitter.ts_utils')
      local current_node = ts_utils.get_node_at_cursor()

      if not current_node then return end

      -- Traverse up the tree to find the top-level node
      while current_node:parent() and current_node:parent():type() ~= "source_file" do
        current_node = current_node:parent()
      end

      if not current_node then
        print("No suitable block found")
        return
      end

      local start_row, start_col, end_row, end_col = current_node:range()
      
      -- Get the text of the node directly
      local lines = vim.api.nvim_buf_get_lines(0, start_row, end_row + 1, false)
      if #lines == 0 then return end
      
      -- Adjust the first and last line for the correct columns
      lines[1] = string.sub(lines[1], start_col + 1)
      lines[#lines] = string.sub(lines[#lines], 1, end_col)
      
      local block_text = table.concat(lines, '\n')
      
      -- Send the block text to the REPL
      iron.send('julia', block_text)
    end

    require("which-key").register({
      S = { setup_send_operator, "send operator" },
      s = { send_tree_sitter_block, "send tree sitter block" },
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
