local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'RRethy/nvim-base16'
  use 'mg979/vim-visual-multi'
  use('tpope/vim-commentary')
  use('tpope/vim-repeat')
  use('tpope/vim-surround')
  use({
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
  })
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'kyazdani42/nvim-web-devicons' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
    },
  })
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  })
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional
      {'glepnir/lspsaga.nvim'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    },
 }
 use {
   "folke/trouble.nvim",
   requires = "nvim-tree/nvim-web-devicons",
   config = function()
   require("trouble").setup {}
   end
 }
 use 'nvim-lua/plenary.nvim'
 use 'ThePrimeagen/harpoon'
 use {'axkirillov/easypick.nvim', requires = 'nvim-telescope/telescope.nvim'}
 use({
   'lewis6991/gitsigns.nvim',
   requires = 'nvim-lua/plenary.nvim',
 })
 use 'jose-elias-alvarez/null-ls.nvim'
 use {
   'nvim-tree/nvim-tree.lua',
   requires = {
     'nvim-tree/nvim-web-devicons', -- optional, for file icons
   },
   tag = 'nightly' -- optional, updated every week. (see issue #1193)
 }
 use 'aspeddro/gitui.nvim'
 use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
end)
