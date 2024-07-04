return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'natecraddock/telescope-zf-native.nvim'
  },
  keys = {
    { "<leader>f", "<cmd>Telescope find_files<cr>", desc="files" },
    { "<leader>g", "<cmd>Telescope live_grep<cr>", desc="grep" },
    { "<leader>b", "<cmd>Telescope buffers<cr>", desc="buffer" },
  },
  config = function()
    require("telescope").setup({
        extensions = {
            ["zf-native"] = {
                -- options for sorting file-like items
                file = {
                    -- override default telescope file sorter
                    enable = true,

                    -- highlight matching text in results
                    highlight_results = true,

                    -- enable zf filename match priority
                    match_filename = true,

                    -- optional function to define a sort order when the query is empty
                    initial_sort = nil,

                    -- set to false to enable case sensitive matching
                    smart_case = true,
                },

                -- options for sorting all other items
                generic = {
                    -- override default telescope generic item sorter
                    enable = true,

                    -- highlight matching text in results
                    highlight_results = true,

                    -- disable zf filename match priority
                    match_filename = false,

                    -- optional function to define a sort order when the query is empty
                    initial_sort = nil,

                    -- set to false to enable case sensitive matching
                    smart_case = true,
                },
            }
        },
    })

    require("telescope").load_extension("zf-native")
  end
}
