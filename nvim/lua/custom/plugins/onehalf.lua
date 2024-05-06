return {
  'sonph/onehalf',
  priority = 1000, -- Make sure to load this before all the other start plugins.

  config = function(plugin)
    vim.opt.rtp:append(plugin.dir .. '/vim')
    -- vim.cmd.colorscheme 'onehalfdark'
  end,
}
