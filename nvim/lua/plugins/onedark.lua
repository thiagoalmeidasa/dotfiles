return {
	"olimorris/onedarkpro.nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	config = function()
		vim.cmd.colorscheme("onedark")
	end,
}

-- vim: ts=2 sts=2 sw=2 et
