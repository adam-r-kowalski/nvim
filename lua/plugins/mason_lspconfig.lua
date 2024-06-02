return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("neodev").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "rust_analyzer", "pyright" }
    })

    local on_attach = function(_, bufnr)
      require("which-key").register({
        D = { vim.lsp.buf.declaration, "declaration" },
        d = { vim.lsp.buf.definition, "definition" },
        i = { vim.lsp.buf.implementation, "implementation" },
        r = { vim.lsp.buf.references, "references" },
      }, { prefix = "g", buffer = bufnr  })
      require("which-key").register({
        K = { vim.lsp.buf.hover, "hover" },
        ["<c-k>"] = { vim.lsp.buf.signature_help, "signature help" },
        ["[d"] = { vim.diagnostic.goto_prev, "previous diagnostic" },
        ["]d"] = { vim.diagnostic.goto_next, "next diagnostic" },
        ["<leader>rn"] = { vim.lsp.buf.rename, "rename" },
        ["<leader>q"] = { vim.diagnostic.setloclist, "quickfix" },
      }, { buffer = bufnr })
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require("mason-lspconfig").setup_handlers({
      function (server_name)
        require("lspconfig")[server_name].setup({
          on_attach = on_attach,
          capabilities = capabilities
        })
      end,
      ["lua_ls"] = function ()
        require("lspconfig")["lua_ls"].setup({
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
      end
    })
  end
}
