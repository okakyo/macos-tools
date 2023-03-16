vim.cmd[[packadd packer.nvim onedark.vim]]

require("packer").startup(function(use)
  use 'wbthomason/packer.nvim'
  use {'neovim/nvim-lspconfig',
       'williamboman/mason.nvim',
       'williamboman/mason-lspconfig.nvim'
     }
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'navarasu/onedark.nvim'
  use 'rstacruz/vim-closer'
  use 'dense-analysis/ale'
  use 'lambdalisue/nerdfont.vim'
  use 'lambdalisue/fern-renderer-nerdfont.vim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
-- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  use 'lambdalisue/fern.vim'
  -- nvim-cmp
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/vim-vsnip"
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
    end
  }
  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }
  end
)

