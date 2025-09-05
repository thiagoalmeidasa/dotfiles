return {
  'lucidph3nx/nvim-sops',
  event = { 'BufEnter *.sops.*' },
  opts = {},
  keys = {
    { '<LocalLeader>se', vim.cmd.SopsEncrypt, desc = 'Encrypt File with SOPS' },
    { '<LocalLeader>sd', vim.cmd.SopsDecrypt, desc = 'Decrypt File with SOPS' },
  },
}
