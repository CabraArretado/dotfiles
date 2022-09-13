local ensure_packer = function()
    -- Ensure that Packer is installed on Neovim start
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

--------------------------------
--- Plugins list to install ----
--------------------------------
return require('packer').startup(
    function(use)
	-- Vim plugins
	use { 'wbthomason/packer.nvim' }
	use { 'morhetz/gruvbox' }
	use { 'joshdick/onedark.vim' }
	use { 'airblade/vim-gitgutter' }
	use { 'tpope/vim-fugitive' }
	use { 'tpope/vim-commentary' }
	use { 'junegunn/fzf' }
	use { 'junegunn/fzf.vim' }
	use { 'christoomey/vim-tmux-navigator' }
	-- Neovim exclusive plugins
	use { 'neovim/nvim-lspconfig' }
	use { 'nvim-treesitter/nvim-treesitter' }
	use { 'nvim-lua/plenary.nvim' }
	use { 'nvim-telescope/telescope.nvim' }
	use { 'nvim-telescope/telescope-fzf-native.nvim' }
	use { 'akinsho/bufferline.nvim' }
	use { 'nvim-lualine/lualine.nvim' }
	use { 'kyazdani42/nvim-web-devicons' }
	use { 'kyazdani42/nvim-tree.lua' }
	use { 'lukas-reineke/indent-blankline.nvim' }
	use { 'hrsh7th/nvim-cmp' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/cmp-cmdline' }
----------------------------------
----------------------------------
----------------------------------
	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require('packer').sync()
	end
end)
