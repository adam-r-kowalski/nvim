return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("neodev").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "rust_analyzer", "pyright" }
    })

    local on_attach = function(_, bufnr)
      local opts = { buffer = bufnr, noremap = true, silent = true }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
    end

    require("mason-lspconfig").setup_handlers({
      function (server_name)
        require("lspconfig")[server_name].setup({
          on_attach = on_attach
        })
      end,
      ["lua_ls"] = function ()
        require("lspconfig")["lua_ls"].setup({
          on_attach = on_attach,
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
