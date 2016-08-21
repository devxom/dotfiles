" ~/.config/nvim/init.vim
"    NeoVim configuration file

" "Auto install plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

" ------------------------------------
" THIS IS WHERE YOUR PLUGINS WILL COME
" ------------------------------------
set t_Co=256

" Turn off filetype plugins before bundles init
filetype off

call plug#begin('~/.vim/plugged')

"{{{ Main
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"}}}

"{{{ Themes
Plug 'morhetz/gruvbox'
"}}}

"{{{ Syntax
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-jade'
Plug 'tpope/vim-markdown'
"}}}

"{{{ Javascript
Plug 'lukaszb/vim-web-indent'
Plug 'jelera/vim-javascript-syntax'
"Plug 'othree/javascript-libraries-syntax.vim'
"}}}
Plug 'elentok/plaintasks.vim'
"Plug 'jtratner/vim-flavored-markdown'

"}}}

call plug#end()

if exists('s:install_plug')
    augroup PlugInstall
        au!
        au VimEnter * PlugInstall
    augroup END
endif

" Add plugins to &runtimepath
call plug#end()


"*****************************************************************************
"" CONFIGURATIONS
"*****************************************************************************
" Enable Indent in plugins
filetype plugin indent on
syntax on
" disable annoying prompt on initial bundle install
set nomore
"-------------------------
" vim-airline
" Colorscheme for airline
let g:airline_theme='understated'
" Set custom left separator
let g:airline_left_sep = '▶'
" Set custom right separator
let g:airline_right_sep = '◀'
" Enable airline for tab-bar
let g:airline#extensions#tabline#enabled = 1
" Don't display buffers in tab-bar with single tab
let g:airline#extensions#tabline#show_buffers = 0
" Display only filename in tab
let g:airline#extensions#tabline#fnamemod = ':t'
" Don't display encoding
let g:airline_section_y = ''
" Don't display filetype
let g:airline_section_x = ''
"--------------------------------------------------
" Colorscheme
colorscheme gruvbox
" Setting up light color scheme
"set background=light
"--------------------------------------------------
" Auto reload changed files
set autoread
" Always change current dirrectory to current-editing-file dir
set autochdir
" Indicates fast terminal connection
set ttyfast
" Set character encoding to use in vim
set encoding=utf-8
" Let vim know what encoding we use in our terminal
set termencoding=utf-8
" Which EOl used. For us it's unix
" Not works with modifiable=no
if &modifiable
    set fileformat=unix
endif

" vim:foldmethod=marker:foldlevel=0
