local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Auto-install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
	print('Installing lazy.nvim....')
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
	print('Done.')
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	--treesitter
	{ 'nvim-treesitter/nvim-treesitter' },
	--telescope
	{ 'nvim-telescope/telescope.nvim',  tag = '0.1.1' },
	dependencies = { 'nvim-lua/plenary.nvim' },
	--trouble
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	--neovim which key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	--neodev
	{ "folke/neodev.nvim",          opts = {} },
	--starline
	{ 'tamton-aquib/staline.nvim' },
	--themes
	{ 'navarasu/onedark.nvim' },
	{ 'Mofiqul/dracula.nvim' },
	{ 'folke/tokyonight.nvim' },
	{ 'ellisonleao/gruvbox.nvim' },
	--tabnin
	{ 'codota/tabnine-nvim',        build = "./dl_binaries.sh" },
	--nvim-web-devicon
	{ 'nvim-tree/nvim-web-devicons' },
	--basic flutter plugins
	{
		'akinsho/flutter-tools.nvim',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim',   -- optional for vim.ui.select
		},
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{                          -- Optional
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'windwp/nvim-autopairs' },


			dependencies = { "nvim-autopairs" },
			{ 'hrsh7th/nvim-cmp' },   -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },   -- Required
		}
	}
})

-- LSP
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
