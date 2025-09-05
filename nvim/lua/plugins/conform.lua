return {
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },

      {
        '<leader>ci',
        '<CR>:ConformInfo<CR>',
        silent = true,
        desc = 'Formatter Info',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable autoformat on certain filetypes
        local enable_filetypes = {
          'terraform',
          'hcl',
          'lua',
        }
        if not vim.tbl_contains(enable_filetypes, vim.bo[bufnr].filetype) then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
      formatters = {
        shfmt = {
          prepend_args = { '-i', '2', '-ci' },
        },
        yapf = {
          prepend_args = { '--style', '{based_on_style: pep8, indent_width: 2}' },
        },
      },
      formatters_by_ft = {
        go = { 'goimports', 'gofmt' },
        helm = { 'prettier' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        lua = { 'stylua' },
        python = { 'ruff_format', 'isort' },
        sh = { 'shfmt', 'shellcheck' },
        terraform = { 'terraform_fmt' },
        hcl = { 'terraform_fmt' },
        tf = { 'terraform_fmt' },
        ['terraform-vars'] = { 'terraform_fmt' },
        yaml = { 'yamlfmt' },
        json = { 'prettier', 'fixjson', 'jq' },
        hcon = { 'pyhocon' },
        markdown = { 'mdformat' },
        dart = { 'dart', 'dcm' },

        -- Use the "*" filetype to run formatters on all filetypes.
        ['*'] = { 'codespell' },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ['_'] = { 'trim_whitespace' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
