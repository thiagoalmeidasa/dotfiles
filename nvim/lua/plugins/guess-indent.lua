return {
  'NMAC427/guess-indent.nvim',
  config = function()
    require('guess-indent').setup {
      on_tab_options = { -- A table of vim options when tabs are detected
        ['expandtab'] = false,
        ["tabstop"] = 2,
      },
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
