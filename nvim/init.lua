vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ee", ":Ex<CR>")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		dependencies = {'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep', 'sharkdp/fd'}
	},
	{
		"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {"c", "rust", "lua", "python", "java", "vim", "vimdoc", "query"},
				auto_install = true,
				highlight = {enable = true},
			})
		end
	},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    })
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)
require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,    
    }
})

vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = false
vim.opt.termguicolors = true
vim.cmd 'colorscheme slate'


