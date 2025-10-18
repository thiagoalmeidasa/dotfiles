return {
  'olimorris/codecompanion.nvim',
  enabled = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
    'echasnovski/mini.pick',
    'echasnovski/mini.diff',
    'ravitemer/mcphub.nvim',
    'franco-ruggeri/codecompanion-spinner.nvim',
    'nvim-lua/plenary.nvim',
    { 'stevearc/dressing.nvim', opts = {} }, -- Optional: Improves `vim.ui.select`
  },
  config = function()
    require('codecompanion').setup {
      display = {
        diff = {
          provider = 'mini_diff',
        },
      },
      strategies = {
        chat = {
          adapter = 'ollama',
        },
        inline = {
          adapter = 'ollama',
        },
        agent = {
          adapter = 'ollama',
        },
      },
      adapters = {
        ollama = function()
          return require('codecompanion.adapters').extend('ollama', {
            opts = {
              stream = true,
            },
            env = {
              url = 'http://localhost:11434',
              api_key = ' ',
            },
            headers = {
              ['Content-Type'] = 'application/json',
              -- ["Authorization"] = "Bearer ${api_key}",
            },
            parameters = {
              sync = true,
            },
            schema = {
              model = {
                -- default = "Llama 3.2 3B Instruct"
                default = 'qwen3:14b',
                -- default = "granite3-moe:1b"
                -- default = "qwen2.5-coder:1.5b"
              },
              num_ctx = {
                default = 10240,
              },
              max_tokens = {
                default = 4096,
              },
              temperature = {
                default = 0.2,
              },
            },
          })
        end,
      },
      extensions = {
        spinner = {},
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
    }
  end,
}
