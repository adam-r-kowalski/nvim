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
    require("which-key").register({
      s = { iron.send_line, "send" },
    }, { mode = "n" })
    require("which-key").register({
      s = { iron.visual_send, "send" },
    }, { mode = "v" })
  end
}
