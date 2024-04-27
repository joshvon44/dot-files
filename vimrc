" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
if has('nvim')
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'https://github.com/neovim/nvim-lspconfig.git'
else
	Plug 'https://github.com/preservim/nerdtree.git'
	Plug 'https://github.com/tpope/vim-fugitive.git'
endif
Plug 'rust-lang/rust.vim'
" Plug 'https://github.com/preservim/vim-markdown.git'
Plug 'https://github.com/tpope/vim-sensible.git'
" This plugin makes it so the hybrid number layout is used, I'm not really a
" fan of it though
Plug 'https://github.com/jeffkreeftmeijer/vim-numbertoggle.git'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Enable line number count
set number

" Remap <C-d> and <C-u> so we center after pressing the key, these keys move
" down half a page
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Make an actual tab width 4 spaces
set tabstop=4
" Indents have width of 4
set shiftwidth=4
" Set number of columns for a tab
set softtabstop=4

" Set colorscheme for text editor
colorscheme catppuccin-mocha

if has('nvim')
	" Don't let neovim try to load powerline
	" for why this works see /usr/share/vim/vimfiles/plugin/powerline.vim
	" Basically by setting this value to 1, it tells pwoerline.vim that
	" powerline is already loaded and we don't need to try to load it
	let g:powerline_loaded = 1
else
	" vim only features
	" Enable the mouse to be used
	set mouse=a
	" Give the editor a consistent powerline look to the terminal
	python3 from powerline.vim import setup as powerline_setup
	python3 powerline_setup()
	python3 del powerline_setup
	set laststatus=2 " Always display the statusline in all windows
	set showtabline=2 " Always display the tabline, even if there is only one tab
	set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
	set t_Co=256
	" Start NERDTree and put the cursor back in the other window.
	autocmd VimEnter * NERDTree | wincmd p
	" Exit Vim if NERDTree is the only window remaining in the only tab.
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
endif
