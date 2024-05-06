-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    default_component_configs = {
      icon = {
        folder_empty = '',
        folder_empty_open = '',
        default = '',
      },
      modified = {
        symbol = '•',
      },
      name = {
        trailing_slash = true,
        highlight_opened_files = true, -- NeoTreeFileNameOpened
        use_git_status_colors = true,
      },
      git_status = {
        symbols = {
          -- Change type
          added = 'A',
          deleted = 'D',
          modified = 'M',
          renamed = 'R',
          -- Status type
          untracked = 'U',
          ignored = 'I',
          unstaged = '',
          staged = 'S',
          conflict = 'C',

        },
      },
    },
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<S-CR>'] = 'system_open',
          O = 'system_open',
          Y = 'copy_selector',
          h = 'parent_or_close',
          l = 'child_or_open',
        },
      },
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          '.git',
          '.DS_Store',
          'thumbs.db',
        },
        never_show = {},
      },
    },

    commands = {
      system_open = function(state)
        -- TODO: remove deprecated method check after dropping support for neovim v0.9
        vim.ui.open(state.tree:get_node():get_id())
      end,
      parent_or_close = function(state)
        local node = state.tree:get_node()
        if node:has_children() and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
        end
      end,
      child_or_open = function(state)
        local node = state.tree:get_node()
        if node:has_children() then
          if not node:is_expanded() then -- if unexpanded, expand
            state.commands.toggle_node(state)
          else -- if expanded and has children, seleect the next child
            if node.type == 'file' then
              state.commands.open(state)
            else
              require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
            end
          end
        else -- if has no children
          state.commands.open(state)
        end
      end,
      copy_selector = function(state)
        local node = state.tree:get_node()
        local filepath = node:get_id()
        local filename = node.name
        local modify = vim.fn.fnamemodify

        local vals = {
          ['BASENAME'] = modify(filename, ':r'),
          ['EXTENSION'] = modify(filename, ':e'),
          ['FILENAME'] = filename,
          ['PATH (CWD)'] = modify(filepath, ':.'),
          ['PATH (HOME)'] = modify(filepath, ':~'),
          ['PATH'] = filepath,
          ['URI'] = vim.uri_from_fname(filepath),
        }

        local options = vim.tbl_filter(function(val)
          return vals[val] ~= ''
        end, vim.tbl_keys(vals))
        if vim.tbl_isempty(options) then
          vim.notify('No values to copy', vim.log.levels.WARN)
          return
        end
        table.sort(options)
        vim.ui.select(options, {
          prompt = 'Choose to copy to clipboard:',
          format_item = function(item)
            return ('%s: %s'):format(item, vals[item])
          end,
        }, function(choice)
          local result = vals[choice]
          if result then
            vim.notify(('Copied: `%s`'):format(result))
            vim.fn.setreg('+', result)
          end
        end)
      end,
    },
  },
}
