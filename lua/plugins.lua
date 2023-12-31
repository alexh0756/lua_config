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

		-- support repl autocomplete
		use 'rcarriga/cmp-dap'

		-- file finder
		use {
  			'nvim-telescope/telescope.nvim', tag = '0.1.5',
			-- or                            , branch = '0.1.x',
  			requires = { 
				{'nvim-lua/plenary.nvim'},
				{'BurntSushi/ripgrep'}
			}
		}
		use 'nvim-telescope/telescope-live-grep-args.nvim'

		use {
			'ThePrimeagen/harpoon',
			branch = 'harpoon2',
			requires = { { 'nvim-lua/plenary.nvim' } }
		}
		-- use 'MeanderingProgrammer/harpoon-core.nvim'

		-- git integration
		use 'NeogitOrg/neogit'
		
		-- syntax highlighting
		use 'nvim-treesitter/nvim-treesitter'

		-- keybindings for comment in/out
		use 'preservim/nerdcommenter'

		-- ctrl+d multi select
		-- use 'mg979/vim-visual-multi'

		-- themes
		use 'Mofiqul/dracula.nvim'
		use 'navarasu/onedark.nvim'
		use "rebelot/kanagawa.nvim"
		use "bluz71/vim-nightfly-colors"
		use "bluz71/vim-moonfly-colors"
		use { 'catppuccin/nvim', as = 'catppuccin' }
		use 'EdenEast/nightfox.nvim'
		

		-- used to send python to the command line
		use 'hkupty/iron.nvim'

		-- git highlighting
		use 'lewis6991/gitsigns.nvim'

		-- add status bar at bottom of nvim
		use 'freddiehaddad/feline.nvim'
		use 'nvim-lualine/lualine.nvim'

		-- used to auto close brackets
		use 'm4xshen/autoclose.nvim'
		use {
			'windwp/nvim-autopairs',
			config = function() require('nvim-autopairs').setup {} end
		}

		-- front page of nvim
		use { 
			'nvimdev/dashboard-nvim',
			event = 'VimEnter',
			config = function()
				require('dashboard').setup {
					theme = 'hyper'
				}
			end,
			requires = { 'nvim-tree/nvim-web-devicons' }
		}
	end)
