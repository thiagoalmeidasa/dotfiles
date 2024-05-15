return {
  'jim-at-jibba/micropython.nvim',
  lazy = true,
  dependencies = {
    'akinsho/toggleterm.nvim',
    'stevearc/dressing.nvim',
  },
  -- cmd = {
  --   'MPRun',
  --   'MPSetPort',
  --   'MPSetBaud',
  --   'MPSetStubs',
  --   'MPRepl',
  --   'MPInit',
  --   'MPUpload',
  --   'MPEraseOne',
  --   'MPUploadAll',
  -- },
  --   require("mini.statusline").setup({
  --     sections = {
  --         lualine_b = {
  --             {
  --               require("micropython_nvim").statusline,
  --               cond = package.loaded["micropython_nvim"] and require("micropython_nvim").exists,
  --             },
  --         }
  --     }
  -- })
}
