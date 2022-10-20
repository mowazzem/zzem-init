call plug#begin('~/.local/share/nvim/plugged')

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

"hybrid vim colors plugin
Plug 'w0ng/vim-hybrid'

Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

"vim-vineger plugin
Plug 'tpope/vim-vinegar'

"vim-fugitive plugin
Plug 'tpope/vim-fugitive'

" vim commit browser integrated with vim-fugitive
Plug 'junegunn/gv.vim'

"vim-repeat plugin
Plug 'tpope/vim-repeat'

"vim-commentary plugin
Plug 'tpope/vim-commentary'

"vim-surround plugin
Plug 'tpope/vim-surround'

"vim-unimpaired plugin
Plug 'tpope/vim-unimpaired'

"vim-rhubarb plugin
Plug 'tpope/vim-rhubarb'

"gruvbox theme
Plug 'morhetz/gruvbox'

"vim auto-pairs plugin
Plug 'windwp/nvim-autopairs'

"vim papercolor-theme
Plug 'NLKNguyen/papercolor-theme'

" neovim lsp-config plugin and nvim-cmp
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-lua/plenary.nvim'
Plug 'petertriho/cmp-git'
" For vsnip users.
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'
" For luasnip users.
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'
" For ultisnips users.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

Plug 'jparise/vim-graphql'
Plug 'sbdchd/neoformat'

Plug 'preservim/tagbar'

Plug 'ray-x/lsp_signature.nvim'
Plug 'ray-x/starry.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'GlennLeo/cobalt2'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'buoto/gotests-vim'

Plug 'vim-test/vim-test'

Plug 'vimwiki/vimwiki'

Plug 'cdelledonne/vim-cmake'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

Plug 'OmniSharp/omnisharp-vim'
call plug#end()
