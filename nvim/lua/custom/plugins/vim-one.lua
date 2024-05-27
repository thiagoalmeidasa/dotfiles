return {
  -- 'rakr/vim-one',
  'rvighne/vim-one',
  ---   call <sid>X('NormalFloat',  s:syntax_fg,     s:syntax_bg,      '')
  priority = 1000, -- Ensure it loads first
  init = function()
    -- Load the colorscheme here.
    -- vim.cmd.colorscheme 'neodark'
    vim.o.termguicolors = true
    vim.cmd.colorscheme 'one'

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
