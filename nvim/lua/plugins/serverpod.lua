-- Serverpod Neovim Plugin
-- Now using the dedicated serverpod-neovim plugin
return {
  {
    dir = '/Users/thiagoalmeida/repos/github.com/serverpod/serverpod-neovim',
    enabled = false,
    -- dev = true,
    config = function()
      require('serverpod-neovim').setup {
        -- LSP settings
        lsp = {
          enable = true,
          cmd = { 'serverpod', '-q', 'language-server', '--stdio' },
          settings = {
            serverpod = {
              completeFunctionCalls = true,
              showTodos = true,
              enableDiagnostics = true,
              enableHover = true,
              enableSignatureHelp = true,
            },
          },
        },

        -- Syntax highlighting
        syntax = {
          enable = true,
          custom_highlights = true,
        },

        -- Treesitter integration
        treesitter = {
          enable = true,
          parser = 'yaml',
        },

        -- Keymaps
        keymaps = {
          enable = true,
          prefix = '<leader>sp',
        },
      }
    end,
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
  },
}
