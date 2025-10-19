return {
  {
    'yetone/avante.nvim',
    build = (vim.fn.has 'win32' ~= 0) and 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false' or 'make',
    event = 'VeryLazy',
    enabled = true,
    version = false,

    opts = {
      mode = 'legacy', -- no agent loop
      provider = 'ollama',

      -- make sure the UI never auto-approves tool runs
      behaviour = {
        auto_approve_tool_permissions = false,
      },

      providers = {
        ollama = {
          endpoint = 'http://127.0.0.1:11434',
          model = 'hf.co/unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:Q4_0',
          disable_tools = true, -- provider-scoped kill switch
          use_ReAct_prompt = false, -- prevent hidden tool-hint prompting
          timeout = 30000,
          extra_request_body = {
            options = {
              stop = vim.NIL,
              num_ctx = 8192,
              num_keep = 128,
              repeat_penalty = 1.08,
              repeat_last_n = 512,
              temperature = 0.2,
              top_p = 0.9,
              num_batch = 512,
              num_thread = 8,
            },
          },
        },
      },
    },

    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'echasnovski/mini.pick',
      'nvim-telescope/telescope.nvim',
      'hrsh7th/nvim-cmp',
      'ibhagwan/fzf-lua',
      'stevearc/dressing.nvim',
      'folke/snacks.nvim',
      'nvim-tree/nvim-web-devicons',
      {
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
            use_absolute_path = true,
          },
        },
      },
      {
        'MeanderingProgrammer/render-markdown.nvim',
        ft = { 'markdown', 'Avante' },
        opts = { file_types = { 'markdown', 'Avante' } },
      },
      {
        'zbirenbaum/copilot.lua',
        optional = true,
        opts = function()
          require('copilot.api').status = require 'copilot.status'
        end,
      },
    },
  },
}
