local cmd = vim.cmd

local on_attach = function(client, _)
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = true,
      signs = true,
      update_in_insert = false,
    }
  )
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#4B5263
      hi LspReferenceText cterm=bold ctermbg=red guibg=#4B5263
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#4B5263
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  if client.resolved_capabilities.document_formatting then
    cmd [[augroup Format]]
    cmd [[autocmd! * <buffer>]]
    cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
    cmd [[augroup END]]
  end
end


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    server:setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
    vim.cmd [[ do User LspAttachBuffers ]]
end)
