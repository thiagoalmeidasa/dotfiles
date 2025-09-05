return {
  'yetone/avante.nvim',
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has 'win32' ~= 0 and 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false' or 'make',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  --- https://github.com/yetone/avante.nvim/blob/main/lua/avante/config.lua
  opts = {
    -- add any opts here
    -- for example
    -- mode = 'legacy',
    -- provider = 'ollama',
    -- mode = 'agentic',
    -- provider = 'copilot',
    mode = 'agentic',
    provider = 'gemini',
    providers = {
      copilot = {
        model = 'claude-sonnet-4',
      },
      gemini = {
        model = 'gemini-2.5-pro',
      },
      ollama = {
        endpoint = 'http://localhost:11434',
        model = 'deepseek-coder-v2:16b-lite-instruct-q4_K_M',
        -- model = 'devstral:24b',
        -- model = 'gpt-oss:20b',
        -- model = 'hf.co/Qwen/Qwen2.5-Coder-32B-Instruct-GGUF:latest',
        -- model = 'hf.co/unsloth/DeepSeek-R1-Distill-Qwen-14B-GGUF:latest',
        -- model = 'mistral-small3.1:24b'
        -- model = 'mistral-small3.2:24b',
        -- model = 'qwen3:8b',
        -- model = 'qwen2.5-coder:7b',
        timeout = 300000, -- Timeout in milliseconds
        extra_request_body = {
          options = {
            temperature = 0.75,
            num_ctx = 20480,
            keep_alive = '5m',
          },
        },
      },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'echasnovski/mini.pick', -- for file_selector provider mini.pick
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
    'ibhagwan/fzf-lua', -- for file_selector provider fzf
    'stevearc/dressing.nvim', -- for input provider dressing
    'folke/snacks.nvim', -- for input provider snacks
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'zbirenbaum/copilot.lua', -- for providers='copilot'
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
