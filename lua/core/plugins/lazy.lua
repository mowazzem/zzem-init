local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'ellisonleao/gruvbox.nvim',
    event = 'VimEnter',
    config = function() vim.cmd([[colorscheme gruvbox]]) end,
  },
  {
    'tpope/vim-vinegar',
  },
  {
    'tpope/vim-commentary',
  },
  {
    'tpope/vim-fugitive',
    cmd = { 'G' },
  },
  {
    'tpope/vim-unimpaired',
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    config = function() require("core.plugin_configs.lsp") end,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function() require("core.plugin_configs.cmp") end,
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'rafamadriz/friendly-snippets' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
    },
  },
  {
    'mfussenegger/nvim-dap',
    config = function() require("core.plugin_configs.dap.dap") end,
  },
  {
    'rcarriga/nvim-dap-ui',
    config = function() require("core.plugin_configs.dap.dap-ui") end,
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    lazy = true,
    cmd = { 'Telescope', 'Telescope find_files', 'Telescope live_grep', 'Telescope buffers', 'Telescope help_tags' },
    config = function() require("core.plugin_configs.telescope") end,
  },
  {
    'nvim-telescope/telescope-dap.nvim',
    keys = { '<leader>dcc', '<leader>dco' },
    config = function() require("core.plugin_configs.dap.telescope-dap") end
  },
  {
    'leoluz/nvim-dap-go',
    ft = { "go", "gomod", "gowork", "gotmpl" },
    config = function() require("core.plugin_configs.dap.go") end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = 'BufWinEnter',
    config = function() require("core.plugin_configs.treesitter") end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function() require("core.plugin_configs.nvim-autopairs") end,
  },
  {
    'fatih/vim-go',
    ft = { "go", "gomod", "gowork", "gotmpl" },
    config = function() require("core.plugin_configs.vimgo") end,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    config = function() require("core.plugin_configs.lualine") end,
    requires = {
      {
        'kyazdani42/nvim-web-devicons',
      }
    },
  },
  {
    'ziglang/zig',
    ft = 'zig',
    config = function() require("core.plugin_configs.zig") end,
  },
  {
    'ziglang/zig.vim',
    ft = 'zig',
  },
  {
    'dstein64/vim-startuptime',
    cmd = { "StartupTime" },
  },
  {
    'akinsho/toggleterm.nvim',
    cmd = { "ToggleTerm" },
    config = function()
      require("toggleterm").setup()
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end,
  },
  {
    'ray-x/lsp_signature.nvim',
    config=function()
      require('lsp_signature').setup()
    end
  }
})
