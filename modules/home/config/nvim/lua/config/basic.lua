local cmd  = vim.cmd

cmd('set autochdir')
cmd('set nocompatible')
cmd('set showmatch')
cmd('set ignorecase')
cmd('set hlsearch')
cmd('set incsearch')               -- incremental search
cmd('set tabstop=4')               -- number of columns occupied by a tab
cmd('set softtabstop=4')           --see multiple spaces as tabstops so <BS> does the right thing
cmd('set expandtab')               -- converts tabs to white space
cmd('set shiftwidth=4')            --width for autoindents
cmd('set autoindent')              -- indent a new line the same amount as the line just typed
cmd('set number relativenumber')   --add line numbers
cmd('syntax on')                   -- syntax highlighting
cmd('set mouse=a')                 -- enable mouse click
cmd('set clipboard=unnamedplus')   --using system clipboard
cmd('filetype plugin indent on')
cmd('filetype plugin on')
cmd('set ttyfast')                 -- Speed up scrolling in Vim
cmd('set noswapfile')              -- disable creating swap file
cmd('set backupdir=~/.cache/vim')  --Directory to store backup files.
cmd('set signcolumn=yes:1')
cmd('set updatetime=4000')
--Hightlight on yank
cmd('au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}')

-- cmd([[let g:python3_host_prog = '/usr/bin/python3']])
cmd('set path+=**')
