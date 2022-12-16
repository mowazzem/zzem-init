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
  use {
      'fatih/vim-go',
      opt = true,
      ft = {'go'},
      config = 'require("core.plugin_configs.vimgo")',
  }
  use {
      'ellisonleao/gruvbox.nvim',
      event = 'VimEnter',
      config = 'require("core.plugin_configs.gruvbox")',
  }
  use {
      'tpope/vim-vinegar',
      opt = true,
      event = 'BufWinEnter'
  }
  use {
      'tpope/vim-fugitive',
      cmd = {'G'},
  }
  use {
      'tpope/vim-commentary',
      event = 'BufWinEnter',
  }
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      enter = 'BufWinEnter',
      config = 'require("core.plugin_configs.treesitter")',
  }
  use {
      'windwp/nvim-autopairs',
      after = 'nvim-cmp',
      config = 'require("core.plugin_configs.nvim-autopairs")',
  }
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} },
      cmd = {'Telescope', 'Telescope find_files','Telescope live_grep', 'Telescope buffers', 'Telescope help_tags'},
      config = 'require("core.plugin_configs.telescope")',
  }
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      event = 'BufWinEnter',
  }
  use {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      config = 'require("core.plugin_configs.cmp")',
      requires = {
          {
              'SirVer/ultisnips',
              after = 'nvim-cmp',
          },
          {
              'quangnguyen30192/cmp-nvim-ultisnips',
              after = 'nvim-cmp',
          },
          {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'},
          {'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
          {'hrsh7th/cmp-path', after = 'nvim-cmp'},
          {'hrsh7th/cmp-cmdline', after = 'nvim-cmp'},
      },
  }
  use {
      'nvim-lualine/lualine.nvim',
      requires = {
          {
              'kyazdani42/nvim-web-devicons',
              opt = true,
          }
      },
      config = 'require("core.plugin_configs.lualine")',
  }
  use 'dstein64/vim-startuptime'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
