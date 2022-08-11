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

"vim-repeat plugin
Plug 'tpope/vim-repeat'

"vim-commentary plugin
Plug 'tpope/vim-commentary'

"vim-surround plugin
Plug 'tpope/vim-surround'

"gruvbox theme
Plug 'morhetz/gruvbox'

"vim auto-pairs plugin
Plug 'jiangmiao/auto-pairs'

"vim papercolor-theme
Plug 'NLKNguyen/papercolor-theme'

" neovim lsp-config plugin and nvim-cmp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
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

" coc.nvim
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'GlennLeo/cobalt2'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
call plug#end()
