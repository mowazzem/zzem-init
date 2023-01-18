local ensure_packer = function()
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

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'fatih/vim-go',
    opt = true,
    ft = { "go", "gomod", "gowork", "gotmpl" },
    config = function() require("core.plugin_configs.vimgo") end,
  }
  use {
    'mfussenegger/nvim-dap',
    config = function() require("core.plugin_configs.dap.dap") end,
  }
  use {
    'rcarriga/nvim-dap-ui',
    config = function() require("core.plugin_configs.dap.dap-ui") end,
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } },
    -- cmd = { 'Telescope', 'Telescope find_files', 'Telescope live_grep', 'Telescope buffers', 'Telescope help_tags' },
    config = function() require("core.plugin_configs.telescope") end,
  }
  use {
    'nvim-telescope/telescope-dap.nvim',
    keys = { '<leader>dcc', '<leader>dco' },
    config = function() require("core.plugin_configs.dap.telescope-dap") end
  }
  use {
    'leoluz/nvim-dap-go',
    ft = { "go", "gomod", "gowork", "gotmpl" },
    config = function() require("core.plugin_configs.dap.go") end,
  }
  use {
    'ellisonleao/gruvbox.nvim',
    event = 'VimEnter',
    config = function() require("core.plugin_configs.gruvbox") end,
  }
  use {
    'tpope/vim-vinegar',
    opt = true,
    event = 'BufWinEnter'
  }
  use {
    'tpope/vim-fugitive',
    cmd = { 'G' },
  }
  use {
    'tpope/vim-commentary',
    event = 'BufWinEnter',
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    enter = 'BufWinEnter',
    config = function() require("core.plugin_configs.treesitter") end,
  }
  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = function() require("core.plugin_configs.nvim-autopairs") end,
  }
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    event = 'VimEnter',
    config = function() require("core.plugin_configs.lsp") end,
  }
  use {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function() require("core.plugin_configs.cmp") end,
    requires = {
      {
        'SirVer/ultisnips',
      },
      { 'quangnguyen30192/cmp-nvim-ultisnips',
        after = 'nvim-cmp',
        config = function()
          --optional call to setup (see customization section)
          require("cmp_nvim_ultisnips").setup {}
        end,
      },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
    },
  }
  use {
    'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    config = function() require("core.plugin_configs.lualine") end,
    requires = {
      {
        'kyazdani42/nvim-web-devicons',
        opt = true,
      }
    },
  }
  use {
    'ziglang/zig',
    ft = 'zig',
    config = function() require("core.plugin_configs.zig") end,
  }
  use {
    'ziglang/zig.vim'
  }
  use 'dstein64/vim-startuptime'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
