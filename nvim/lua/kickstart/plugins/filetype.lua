return {
  vim.filetype.add {
    filename = {
      ['.envrc'] = 'direnv',
      ['.flake8'] = 'ini',
      ['MANIFEST.in'] = 'pymanifest',
    },
    extension = {
      conf = 'conf',
      ivy = 'xml',
      jinja = 'htmldjango',
      jinja2 = 'htmldjango',
      log = 'log',
    },
    pattern = {
      ['.*/.github/workflows/.*%.yaml'] = 'yaml.ghaction',
      ['.*/.github/workflows/.*%.yml'] = 'yaml.ghaction',
      ['.*requirements%.in'] = 'requirements',
      ['.*requirements%.txt'] = 'requirements',
      ['/templates/*\\.(tpl|yaml)$|*.gotmpl|helmfile*.yaml'] = 'helm',
    },
  },
}
