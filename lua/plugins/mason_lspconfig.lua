return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "rust_analyzer", "pyright" }
    })
    require("mason-lspconfig").setup_handlers({
        function (server_name)
            require("lspconfig")[server_name].setup({})
        end
    })
  end
}
