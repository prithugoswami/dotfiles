vim.cmd [[packadd packer.nvim]]

-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'junegunn/goyo.vim'
  use 'MunifTanjim/nui.nvim'
  use 'dpayne/CodeGPT.nvim'


  -- themes
  use 'ayu-theme/ayu-vim'
  use 'folke/tokyonight.nvim'
  use 'LunarVim/Colorschemes'
  use 'chriskempson/base16-vim'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'
  -- set this up when winbar is available
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
  }
  use 'neoclide/vim-jsx-improve'
  use 'simrat39/symbols-outline.nvim'

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  -- tpope deserves his own section. All hail lord tpope!
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'

  -- telescope
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- treesitter
  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = ':TSUpdate'
  -- }

  use 'simeji/winresizer'
  use 'rstacruz/vim-closer'
  use {'iamcco/markdown-preview.nvim'}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    }
  }

end)
