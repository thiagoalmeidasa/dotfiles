return {
  'qvalentin/helm-ls.nvim',
  ft = { 'helm', 'yaml.helm-values' },
  init = function()
    -- Add helm-related filetype mappings
    vim.filetype.add {
      extension = {
        gotmpl = 'helm',
      },
      pattern = {
        -- Match helm template files in templates directories
        ['.*/templates/.*%.tpl'] = 'helm',
        ['.*/templates/.*%.yaml'] = 'helm',
        ['helmfile.*%.yaml'] = 'helm',
      },
    }
  end,
  opts = {
    conceal_templates = {
      -- enable the replacement of templates with virtual text of their current values
      enabled = false,
    },
    indent_hints = {
      -- enable hints for indent and nindent functions
      enabled = true,
      -- show the hints only for the line the cursor is on
      only_for_current_line = true,
    },
  },
}
