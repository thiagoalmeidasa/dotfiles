return {
  -- Support HCL and other Hashicorp specific syntaxes
  {
    'hashivim/vim-terraform',
    ft = { 'hcl', 'terraform' },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "ANGkeith/telescope-terraform-doc.nvim",
        config = function()
          require("telescope").load_extension("terraform_doc")
        end,
      },
      {
        "cappyzawa/telescope-terraform.nvim",
        config = function()
          require("telescope").load_extension("terraform")
        end,
      },
    },
  }
}
