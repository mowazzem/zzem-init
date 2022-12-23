vim.g.mapleader = ","

function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.o.syntax = 'on'

vim.opt.termguicolors = true
vim.opt.background = 'dark'

vim.opt.filetype = 'on'
vim.opt.filetype.plugin = 'on'
vim.opt.filetype.indent = 'on'

vim.opt.encoding = 'utf-8'

vim.opt.showmatch = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.mouse = 'a'
vim.opt.wildmenu = true

vim.opt.cursorline = true
vim.opt.cmdheight = 1
vim.opt.hid = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.magic = true
vim.opt.showmatch = true
vim.opt.mat = 2

vim.g.noerrorbells = true
vim.g.novisualbell = true

vim.g.tm = 500
vim.g.foldcolumn = 1
vim.g.history = 500
vim.g.autoread = true
vim.g.laststatus = 2

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.lbr = true
vim.opt.tw = 500

vim.opt.ai = true
vim.opt.si = true
vim.opt.wrap = true

vim.opt.completeopt = "menu,menuone,noselect"
vim.g.nocompatible = true
vim.g.wildignorecase = true

--map("n","*",":<C-u>call VisualSelection('','')<CR>/<C-R>=@/<CR><CR>",{silent=true})

map("n", "<leader>w", ":w!<cr>", { silent = true })
map("n", "<leader><cr>", ":noh<cr>", { silent = true })
map("n", "<leader>si", ":source %<cr>", { silent = false })

vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")


vim.keymap.set("n", "<leader>vs", ":vs<cr><C-W>l")
vim.keymap.set("n", "<leader>sp", ":sp<cr><C-W>j")

vim.keymap.set("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>")

vim.cmd([[autocmd FileType c,cpp,go setlocal noet ci pi sts=0 sw=4 ts=4]])
