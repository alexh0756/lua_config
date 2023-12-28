return require('packer').startup(function(use)
--configuration is going here
		use 'wbthomason/packer.nvim'
		use 'williamboman/mason.nvim'
		use 'williamboman/mason-lspconfig.nvim'
		use 'neovim/nvim-lspconfig'
		
		-- Plugins for code completion
		use 'hrsh7th/nvim-cmp'
		use 'hrsh7th/cmp-nvim-lsp'
		use 'hrsh7th/cmp-nvim-lua'
		use 'hrsh7th/cmp-nvim-lsp-signature-help'
		use 'hrsh7th/cmp-vsnip'
		use 'hrsh7th/cmp-path'
		use 'hrsh7th/cmp-buffer'
		use 'hrsh7th/vim-vsnip'
		
		-- Nvimtree for file exploring
		use {
			'nvim-tree/nvim-tree.lua',
			requires = {
				'nvim-tree/nvim-web-devicons',
			},
		}
		-- DAP for Debugging
		use 'mfussenegger/nvim-dap'
		use {
			'rcarriga/nvim-dap-ui',
			requires = {
				'mfussenegger/nvim-dap'
			}
		}

		use {
  			'nvim-telescope/telescope.nvim', tag = '0.1.5',
			-- or                            , branch = '0.1.x',
  			requires = { {'nvim-lua/plenary.nvim'} }
		}
		
		use 'Mofiqul/dracula.nvim'
		use 'navarasu/onedark.nvim'
		use "rebelot/kanagawa.nvim"
		use "bluz71/vim-nightfly-colors"
		use 'hkupty/iron.nvim'
		use 'm4xshen/autoclose.nvim'
	end)
