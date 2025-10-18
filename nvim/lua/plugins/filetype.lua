return {
  vim.filetype.add {
    filename = {
      ['.envrc'] = 'direnv',
      ['.flake8'] = 'ini',
      ['MANIFEST.in'] = 'pymanifest',
      ['devcontainer.json'] = 'jsonc',
      ['Kptfile'] = 'yaml',
    },
    extension = {
      conf = 'conf',
      ivy = 'xml',
      jinja = 'htmldjango',
      jinja2 = 'htmldjango',
      log = 'log',
      mdc = 'markdown',
      spy = 'serverpod',
    },
    pattern = {
      -- ['.*/.github/workflows/.*%.yaml'] = 'yaml.ghaction',
      -- ['.*/.github/workflows/.*%.yml'] = 'yaml.ghaction',
      ['.*/%.github/workflows/.*%.ya?ml'] = 'yaml.ghaction',
      ['.*%.spy.ya?ml'] = 'serverpod',
      ['.*requirements%.in'] = 'requirements',
      ['.*requirements%.txt'] = 'requirements',
      -- ['/templates/*\\.(tpl|yaml)$|*.gotmpl|helmfile*.yaml'] = 'helm',
    },
  },
}

-- { scheme: 'file', language: 'yaml', pattern: '**/protocol/**/*.yaml' },
-- { scheme: 'file', language: 'yaml', pattern: '**/models/**/*.yaml' },
-- { scheme: 'file', pattern: '**/*.spy.yaml' },
-- { scheme: 'file', pattern: '**/*.spy.yml' },
-- { scheme: 'file', pattern: '**/*.spy' },
