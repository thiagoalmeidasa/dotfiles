return {
  'esensar/nvim-dev-container',
  event = 'VeryLazy',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      opts.ensure_installed = {
        'jsonc', -- for devcontainer.json
      }
    end,
  },
  config = function()
    require('devcontainer').setup {}
  end,
}
