lspconfig = require "lspconfig"
util = require "lspconfig/util"

lspconfig.pylsp.setup {
	cmd = {"pylsp"},
	filetype = {"py", "ipynb"},	
	root_dir = util.root_pattern{".git"},
	settings = {
		pylsp = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}
