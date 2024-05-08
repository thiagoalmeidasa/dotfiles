return {
  'jim-at-jibba/micropython.nvim',
  dependencies = {
    'akinsho/toggleterm.nvim',
    'stevearc/dressing.nvim',
  },
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
