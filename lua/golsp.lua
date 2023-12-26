-- Require LSP configuration from the plugin- so we can attahc GOPLS to it
lspconfig = require "lspconfig"
util = require "lspconfig/util"

lspconfig.gopls.setup {
	cmd = {"gopls", "serve"},
	filetype = {"go", "gomod"},	
	root_dir = util.root_pattern{"go.work", "go.mod", ".git"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}
