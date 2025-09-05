-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `opts` key (recommended), the configuration runs
-- after the plugin has been loaded as `require(MODULE).setup(opts)`.

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.o.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        -- Search group (Telescope)
        { '<leader>s', group = '[S]earch', icon = '🔍' },
        { '<leader>sh', desc = 'Search Help' },
        { '<leader>sk', desc = 'Search Keymaps' },
        { '<leader>sf', desc = 'Search Files' },
        { '<leader>ss', desc = 'Search Select Telescope' },
        { '<leader>sw', desc = 'Search current Word' },
        { '<leader>sg', desc = 'Search by Grep' },
        { '<leader>sd', desc = 'Search Diagnostics' },
        { '<leader>sr', desc = 'Search Resume' },
        { '<leader>s.', desc = 'Search Recent Files' },
        { '<leader>s/', desc = 'Search in Open Files' },
        { '<leader>sn', desc = 'Search Neovim files' },

        -- Toggle group
        { '<leader>t', group = '[T]oggle', icon = '🔄' },
        { '<leader>tb', desc = 'Toggle git blame line' },
        { '<leader>tD', desc = 'Toggle git show Deleted' },
        { '<leader>th', desc = 'Toggle Inlay Hints' },

        -- Git Hunk group
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' }, icon = '🔀' },
        { '<leader>hs', desc = 'Git stage hunk', mode = { 'n', 'v' } },
        { '<leader>hr', desc = 'Git reset hunk', mode = { 'n', 'v' } },
        { '<leader>hS', desc = 'Git Stage buffer' },
        { '<leader>hu', desc = 'Git undo stage hunk' },
        { '<leader>hR', desc = 'Git Reset buffer' },
        { '<leader>hp', desc = 'Git preview hunk' },
        { '<leader>hb', desc = 'Git blame line' },
        { '<leader>hd', desc = 'Git diff against index' },
        { '<leader>hD', desc = 'Git Diff against last commit' },

        -- LSP group
        { 'gr', group = 'LSP [G]oto/[R]efactor', icon = '🔧' },
        { 'grn', desc = 'LSP: [R]e[n]ame' },
        { 'gra', desc = 'LSP: Code [A]ction', mode = { 'n', 'x' } },
        { 'grr', desc = 'LSP: [G]oto [R]eferences' },
        { 'gri', desc = 'LSP: [G]oto [I]mplementation' },
        { 'grd', desc = 'LSP: [G]oto [D]efinition' },
        { 'grD', desc = 'LSP: [G]oto [D]eclaration' },
        { 'grt', desc = 'LSP: [G]oto [T]ype Definition' },

        -- LSP Document/Workspace Symbols (standalone keymaps)
        { 'gO', desc = 'LSP: [O]pen Document Symbols', icon = '📄' },
        { 'gW', desc = 'LSP: Open [W]orkspace Symbols', icon = '🗂️' },

        -- Debug group
        { '<leader>d', group = '[D]ebug', icon = '🐛' },
        { '<leader>db', desc = 'Debug: Toggle Breakpoint' },
        { '<leader>dB', desc = 'Debug: Set Breakpoint' },

        -- Format/Code group
        { '<leader>c', group = '[C]ode/Format', icon = '📝' },
        { '<leader>f', desc = 'Format buffer' },
        { '<leader>ci', desc = 'Formatter Info' },

        -- File operations
        { '<leader>e', desc = 'Show diagnostic Error messages' },
        { '<leader>q', desc = 'Open diagnostic Quickfix list' },

        -- Navigation
        { ']', group = 'Next', icon = '➡️' },
        { ']c', desc = 'Next git [c]hange' },
        { ']d', desc = 'Next [d]iagnostic' },
        { '[', group = 'Previous', icon = '⬅️' },
        { '[c', desc = 'Previous git [c]hange' },
        { '[d', desc = 'Previous [d]iagnostic' },

        -- Function keys (Debug)
        { '<F1>', desc = 'Debug: Step Into' },
        { '<F2>', desc = 'Debug: Step Over' },
        { '<F3>', desc = 'Debug: Step Out' },
        { '<F5>', desc = 'Debug: Start/Continue' },
        { '<F7>', desc = 'Debug: Toggle UI' },

        -- Special keymaps
        { '<leader><leader>', desc = 'Find existing buffers' },
        { '<leader>/', desc = 'Fuzzily search in current buffer' },
        { '\\', desc = 'NeoTree reveal' },

        -- SOPS operations (LocalLeader)
        { '<LocalLeader>s', group = 'SOPS', icon = '🔐' },
        { '<LocalLeader>se', desc = 'SOPS [E]ncrypt File' },
        { '<LocalLeader>sd', desc = 'SOPS [D]ecrypt File' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
