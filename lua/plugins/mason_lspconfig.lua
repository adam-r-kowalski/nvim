return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    { "folke/trouble.nvim", opts = {} },
  },
  config = function()
    require("neodev").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "tsserver", "html", "julials" }
    })

    local on_attach = function(_, bufnr)
      require("which-key").register({
        D = { vim.lsp.buf.declaration, "declaration" },
        d = { vim.lsp.buf.definition, "definition" },
        i = { vim.lsp.buf.implementation, "implementation" },
        r = { "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "references" },
        h = { vim.lsp.buf.hover, "hover" },
      }, { prefix = "g", buffer = bufnr  })

      require("which-key").register({
        ["[d"] = { vim.diagnostic.goto_prev, "previous diagnostic" },
        ["]d"] = { vim.diagnostic.goto_next, "next diagnostic" },
        ["<leader>rn"] = { vim.lsp.buf.rename, "rename" },
        ["<leader>q"] = { "<cmd>Trouble diagnostics toggle<cr>", "quickfix" },
      }, { buffer = bufnr })
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local lspconfig = require("lspconfig")

    require("mason-lspconfig").setup_handlers({
      function (server_name)
        lspconfig[server_name].setup({
          on_attach = on_attach,
          capabilities = capabilities
        })
      end,
      ["lua_ls"] = function ()
        lspconfig["lua_ls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace"
              }
            }
          }
        })
      end,
      lspconfig["julials"].setup({
        cmd = {
          "julia",
          "--startup-file=no",
          "--history-file=no",
          "--project=" .. vim.fn.getcwd(),
          "-e",
          [[
            using Pkg; Pkg.activate(".")
            using LanguageServer, LanguageServer.SymbolServer
            runserver()
          ]]
        },
        filetypes = {"julia"},
      })
    })
  end
}
