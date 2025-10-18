return {
  'yetone/avante.nvim',
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has 'win32' ~= 0 and 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false' or 'make',
  event = 'VeryLazy',
  enabled = true,
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  --- https://github.com/yetone/avante.nvim/blob/main/lua/avante/config.lua
  opts = {
    -- add any opts here
    -- for example
    mode = 'legacy',
    provider = 'ollama',
    -- mode = 'agentic',
    -- provider = 'copilot',
    -- mode = 'agentic',
    -- provider = 'gemini',
    providers = {
      -- copilot = {
      --   -- model = 'claude-sonnet-4',
      -- },
      -- gemini = {
      --   model = 'gemini-2.5-pro',
      -- },
      -- ollama = {
      --   endpoint = 'http://localhost:11434',
      --   -- model = 'deepseek-coder-v2:16b-lite-instruct-q4_K_M',
      --   -- model = 'hf.co/unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:latest',
      --   -- model = 'hf.co/unsloth/Qwen3-14B-128K-GGUF:Q8_0',
      --   -- model = 'devstral:24b',
      --   -- model = 'gpt-oss:20b',
      --   -- model = 'hf.co/Qwen/Qwen2.5-Coder-32B-Instruct-GGUF:latest',
      --   -- model = 'hf.co/unsloth/DeepSeek-R1-Distill-Qwen-14B-GGUF:latest',
      --   -- model = 'mistral-small3.1:24b'
      --   -- model = 'mistral-small3.2:24b',
      --   -- model = 'qwen3-coder:30b',
      --   model = 'qwen3:8b',
      --   -- model = 'qwen2.5:7b',
      --   -- model = 'qwen2.5-coder:7b',
      --   timeout = 300000, -- Timeout in milliseconds
      --   think = 'low',
      --   -- extra_request_body = {
      --   --   options = {
      --   --     temperature = 0.75,
      --   --     num_ctx = 20480,
      --   --     keep_alive = '5m',
      --   --   },
      --   -- },
      -- },
      ollama = {
        endpoint = 'http://127.0.0.1:11434',
        model = 'qwen3:14b',
        -- model = 'hf.co/unsloth/Qwen3-14B-128K-GGUF:Q8_0',
        -- model = 'magistral:24b',
        -- model = 'qwen2.5-coder:7b',
        -- model = 'hf.co/Qwen/Qwen2.5-Coder-32B-Instruct-GGUF:latest',
        hide_in_model_selector = false,
        -- legacy = true,
        disable_tools = true,
        timeout = 300000, -- Timeout in milliseconds
        extra_request_body = {
          options = {
            temperature = 0.4,
            -- num_ctx = 40960,
            num_ctx = 81920,
            think = false,
          },
          think = false,
          -- system = "You are a highly skilled software engineer with extensive knowledge in many programming languages, frameworks, design patterns, and best practices.\n\nRespect and use existing conventions, libraries, etc that are already present in the code base.\n\nMake sure code comments are in English when generating them.\n\nAs an AI coding agent, you have access to various tools to help you understand and work with the codebase. Always utilize the available tools when they can provide better context or information about the code you're working with. Use tools to read files, search for patterns, explore project structure, and gather any necessary context before making changes or suggestions.\n\nPrioritize using tools over making assumptions about code that isn't directly visible in the conversation.",
        },
        -- is_env_set = function()
        --   return true
        -- end,
      },
      -- ['Qwen3-Coder-30B'] = {
      --   __inherited_from = 'ollama',
      --   model = 'hf.co/unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:Q8_0',
      -- },
      -- ['Qwen3-32B'] = {
      --   __inherited_from = 'ollama',
      --   model = 'qwen3:32b',
      -- },
      -- ['unsloth-Qwen3-32B'] = {
      --   __inherited_from = 'ollama',
      --   model = 'hf.co/unsloth/Qwen3-32B-GGUF:Q4_K_M',
      -- },
      -- ['qwen2.5'] = {
      --   __inherited_from = 'ollama',
      --   model = 'qwen2.5:7b',
      --   legacy = true,
      --   disable_tools = true,
      -- },
      -- ['qwen2.5-coder'] = {
      --   __inherited_from = 'ollama',
      --   model = 'qwen2.5-coder:7b',
      --   legacy = true,
      --   disable_tools = true,
      -- },
      -- ['qwen3'] = {
      --   __inherited_from = 'ollama',
      --   model = 'qwen3:8b',
      -- },
      -- ['deepseek-coder-v2'] = {
      --   __inherited_from = 'ollama',
      --   model = 'deepseek-coder-v2:16b-lite-instruct-q4_K_M',
      --   legacy = true,
      --   disable_tools = true,
      -- },
      -- ['mistral-small3'] = {
      --   __inherited_from = 'ollama',
      --   model = 'mistral-small3.2:24b',
      -- },
      -- ['deepseek-r1'] = {
      --   __inherited_from = 'ollama',
      --   model = 'hf.co/unsloth/DeepSeek-R1-Distill-Qwen-14B-GGUF:Q4_K_M',
      --   legacy = true,
      --   disable_tools = true,
      -- },
      -- ['qwen3-14b'] = {
      --   __inherited_from = 'ollama',
      --   model = 'qwen3:14b',
      -- },
      -- ['qwen3-14b-128k'] = {
      --   __inherited_from = 'ollama',
      --   model = 'hf.co/unsloth/Qwen3-14B-128K-GGUF:Q8_0',
      -- },
      -- ['devstral'] = {
      --   __inherited_from = 'ollama',
      --   model = 'devstral:24b',
      -- },
      -- ['gpt-oss'] = {
      --   __inherited_from = 'ollama',
      --   model = 'gpt-oss:20b',
      -- },
      -- ['deepseek-r1-0528-qwen3-8b'] = {
      --   __inherited_from = 'ollama',
      --   model = 'hf.co/unsloth/DeepSeek-R1-0528-Qwen3-8B-GGUF:Q8_0',
      --   legacy = true,
      --   disable_tools = true,
      -- },
      -- ['gemma3-12b'] = {
      --   __inherited_from = 'ollama',
      --   model = 'gemma3:12b',
      --   legacy = true,
      --   disable_tools = true,
      -- },
      -- ['gemma3-27b'] = {
      --   __inherited_from = 'ollama',
      --   model = 'gemma3:27b',
      --   legacy = true,
      --   disable_tools = true,
      -- },
      -- ['phi4'] = {
      --   __inherited_from = 'ollama',
      --   model = 'phi4:14b',
      --   legacy = true,
      --   disable_tools = true,
      -- },
      -- ['llama-3.2-3b'] = {
      --   __inherited_from = 'ollama',
      --   model = 'hf.co/unsloth/Llama-3.2-3B-Instruct-GGUF:latest',
      -- },
      -- ['gemma3n-e4b'] = {
      --   __inherited_from = 'ollama',
      --   model = 'gemma3n:e4b',
      --   legacy = true,
      --   disable_tools = true,
      -- },
    },
    -- selector = {
    --   provider = 'snacks',
    -- },
    -- system_prompt as function ensures LLM always has latest MCP server state
    -- This is evaluated for every message, even in existing chats
    -- system_prompt = function()
    --   local hub = require('mcphub').get_hub_instance()
    --   return hub and hub:get_active_servers_prompt() or ''
    -- end,
    -- Using function prevents requiring mcphub before it's loaded
    -- custom_tools = function()
    --   return {
    --     require('mcphub.extensions.avante').mcp_tool(),
    --   }
    -- end,
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
      'zbirenbaum/copilot.lua', -- for providers='copilot'
      optional = true,
      opts = function()
        require('copilot.api').status = require 'copilot.status'
      end,
    },
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
