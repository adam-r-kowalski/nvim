return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    'neovim/nvim-lspconfig',
    'onsails/lspkind.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    { 'L3MON4D3/LuaSnip', build = "make install_jsregexp" },
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    vim.opt.completeopt = { "menu", "menuone", "noselect" }
    vim.opt.shortmess:append "c"
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    lspkind.init {}

    cmp.setup({
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = 'path' },
        { name = "vsnip" },
        { name = "buffer" }
      }),
      mapping = cmp.mapping.preset.insert({
        ["<c-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<c-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<c-y>"] = cmp.mapping(
          cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          },
          { "i", "c" }
        ),
        ["<c-b>"] = cmp.mapping.scroll_docs(-4),
        ["<c-f>"] = cmp.mapping.scroll_docs(4),
      }),
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol',
          maxwidth = 50,
          ellipsis_char = '...',
          show_labelDetails = true,
          before = function(entry, vim_item)
            return vim_item
          end
        })
      }
    })
    local ls = require("luasnip")
    vim.keymap.set({"i", "s"}, "<c-k>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })
    vim.keymap.set({"i", "s"}, "<c-j>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })
  end
}
