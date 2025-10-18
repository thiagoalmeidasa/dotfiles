-- return {
--   "cuducos/yaml.nvim",
--   ft = { "yaml" }, -- optional
--   dependencies = {
--     "nvim-treesitter/nvim-treesitter",
--     "nvim-telescope/telescope.nvim", -- optional
--   },
-- }

return {

  -- a downloaded copy of the SchemaStore.org catalog
  -- (used by JSON & YAML LSPs)
  {
    'b0o/SchemaStore.nvim',
    lazy = true,
    version = false, -- last release is way too old
  },

  {
    'mosheavni/yaml-companion.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'b0o/SchemaStore.nvim',
    },
    lazy = true,
    version = false, -- get the latest commit, the last release is >2 yrs ago
    -- ft = { 'yaml' },
    ft = { 'yaml', 'yaml.*' },
    config = function()
      require('telescope').load_extension 'yaml_schema'
    end,
  },
  {
    'cenk1cenk2/schema-companion.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      -- PLEASE FOLLOW THE CONFIGURATION INSTRUCTIONS BELOW SINCE THERE IS AN ADDITIONAL STEP NEEDED FOR EACH LANGUAGE SERVER
      require('schema-companion').setup {}
    end,
  },

  {
    'cuducos/yaml.nvim',
    ft = { '*yaml*' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      -- tell the plugin to expect these filetypes:
      ft = {
        'yaml',
        'eruby.yaml',
        'yaml.ansible',
      },
    },
  },
}
