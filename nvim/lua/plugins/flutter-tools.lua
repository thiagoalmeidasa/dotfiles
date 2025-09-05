return {
  'nvim-flutter/flutter-tools.nvim',
  enabled = true,
  -- event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    -- local telescope = require 'telescope'
    --
    -- -- This function extends the shared LSP keymaps with Flutter-specific ones
    -- local on_attach = function(client, bufnr)
    --   -- First, apply all the shared LSP keymaps
    --   require('custom.lsp-keymaps').on_attach(client, bufnr)
    --
    --   -- Helper function to set keymaps (for Flutter-specific ones)
    --   local function map(keys, func, desc, mode)
    --     mode = mode or 'n'
    --     vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'Flutter: ' .. desc })
    --   end
    --
    --   -- Flutter specific keymaps
    --   map('<leader>tr', '<cmd>FlutterRun<cr>', '[R]un')
    --   map('<leader>tq', '<cmd>FlutterQuit<cr>', '[Q]uit')
    --   map('<leader>tR', '<cmd>FlutterReload<cr>', '[R]eload')
    --   map('<leader>tS', '<cmd>FlutterRestart<cr>', 'Re[S]tart')
    --   map('<leader>tD', '<cmd>FlutterDevices<cr>', '[D]evices')
    --   map('<leader>te', '<cmd>FlutterEmulators<cr>', '[E]mulators')
    --   map('<leader>to', '<cmd>FlutterOutlineOpen<cr>', '[O]utline Open')
    --   map('<leader>tc', '<cmd>FlutterOutlineToggle<cr>', 'Outline Toggle ([C]lose)')
    --   map('<leader>td', '<cmd>FlutterDevTools<cr>', '[D]ev Tools')
    --   map('<leader>tO', '<cmd>FlutterOpenDevTools<cr>', '[O]pen Dev Tools')
    --   map('<leader>tp', '<cmd>FlutterCopyProfilerUrl<cr>', 'Copy [P]rofiler URL')
    --   map('<leader>tl', '<cmd>FlutterLspRestart<cr>', '[L]SP Restart')
    --
    --   -- Use Telescope for Flutter commands
    --   if telescope then
    --     telescope.load_extension 'flutter'
    --     map('<leader>Ff', '<cmd>Telescope flutter commands<cr>', 'Commands (Telescope)')
    --   end
    -- end
    require('flutter-tools').setup {
      lsp = {
        -- on_attach = on_attach,
        capabilities = function()
          -- Get capabilities from blink.cmp if available
          local has_blink, blink = pcall(require, 'blink.cmp')
          if has_blink then
            return blink.get_lsp_capabilities()
          else
            return vim.lsp.protocol.make_client_capabilities()
          end
        end,
      },
    }
  end,
}
