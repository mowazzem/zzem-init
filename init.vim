source ~/.config/nvim/vim_plug.vim
source ~/.config/nvim/basic.vim

set laststatus=2
set nu
set rnu
set cursorline
set noshowmode
colorscheme gruvbox
noremap <CR> o<ESC>k
" let g:go_auto_type_info = 1
if !has('gui_running')
  set t_Co=256
endif


set completeopt=menu,menuone,noselect

nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>tt :TagbarToggle<CR>
nmap <leader>vs :vs<CR><C-l>
nmap <leader>sp :sp<CR><C-j>

" vim-test mapping
nmap <silent> <leader>vtt :TestNearest<CR>
nmap <silent> <leader>vtT :TestFile<CR>
nmap <silent> <leader>vta :TestSuite<CR>
nmap <silent> <leader>vtl :TestLast<CR>
nmap <silent> <leader>vtg :TestVisit<CR>



nmap <silent> <leader>fmtl :lua vim.lsp.buf.formatting()<CR>


set completeopt=menu,menuone,noselect

let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_fmt_command="gopls"
" let g:go_gopls_gofumpt=1

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8



let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
\ }
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"


let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
lang ja_JP.UTF-8

let g:gotests_bin = '/Users/mowazzemhosen/go/bin/gotests'

set termguicolors
lua <<END
require('lsp_config')
require('evil_lualine')
require('telescope_config')
require('nvim-autopairs').setup()
END

autocmd FileType lua set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType graphql set tabstop=8|set shiftwidth=8|set expandtab
" autocmd FileType go set tabstop=4|set shiftwidth=4|set expandtab

" vimwiki todo symbols
let g:vimwiki_listsyms = '✗○◐●✓'

" custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

nnoremap <leader>nf <cmd>Neoformat<cr>
let g:cmake_link_compile_commands = 1
