colorscheme zellner

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin('~/.vim/bundle')
Plug 'heavenshell/vim-pydocstring'
Plug 'tpope/vim-sensible'
Plug 'git@github.com:w0rp/ale.git'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'rubik/vim-radon'
"Plug 'scrooloose/nerdtree'
Plug 'szw/vim-tags'
Plug 'bronson/vim-toggle-wrap'
Plug 'lokaltog/vim-easymotion'
"Plug 'vim-scripts/OmniCppComplete'
Plug 'doxygen/doxygen'
Plug 'vim-scripts/DoxygenToolkit.vim'
"Plug 'maksimr/vim-jsbeautify', {'for': ['javascript', 'html', 'css']}
"Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'vim-scripts/bash-support.vim', {'for': 'bash'}
call plug#end()


" Syntastic C/C++ options
let g:syntastic_cpp_check_header=1
let g:syntastic_cpp_include_dirs=['.', '..', '../include','../../include', '../../../include', '/usr/include/eigen3','/usr/include/pcl-1.7']
let g:syntastic_cpp_compiler_options = ' -std=c++11 -Wall'
let g:syntastic_cpp_cpplint_exec = 'cpplint --linelength=120'
let g:syntastic_cpp_checkers = ['cpplint', 'clang-check', 'cppclean', 'gcc']

" Syntastic Python options
let g:syntastic_python_python_exec = 'python2'
let g:syntastic_python_checkers = ['pylint', 'pyflakes', 'pep257']
let g:syntastic_python_pyflakes_args = "--max-line-length=120"

" Syntastic shared options
let g:syntastic_quiet_messages = { 'regex': ['after other header', '#pragma once in main file', 'Missing space before ', 'in any directly #included header', 'Include the directory when naming .h', 'unapproved C++11 header', 'snake_case']}
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list=1

" Vim-jsbeautify Plugin setup
" apply beautify to full buffer
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" apply beautify to visual/select region 
autocmd FileType javascript vnoremap <buffer>  <c-b> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-b> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-b> :call RangeCSSBeautify()<cr>

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

set title
set paste

" Setup persistent undo
" Requires .vim/undodir
set undodir=~/.vim/undodir
set undofile

set tabstop=4
set shiftwidth=4
set expandtab
set ruler

set ignorecase
set smartcase
set showmatch
set incsearch
set hlsearch
highlight IncSearch ctermbg=DarkBlue ctermfg=Green
highlight Search ctermbg=DarkBlue ctermfg=Green

set clipboard=unnamed
set dictionary=/usr/share/dict/words
syntax on
filetype on

set smartindent

set tabstop=4
set shiftwidth=4
set expandtab

highlight Folded ctermbg=none ctermfg=darkgreen

au BufNewFile,BufRead *.launch set filetype=xml
au BufNewFile,BufRead *.html set filetype=html
au BufNewFile,BufRead *.js set filetype=javascript
au BufNewFile,BufRead *.problem set filetype=lisp
au BufNewFile,BufRead *.domain set filetype=lisp
au BufWinLeave * mkview
au BufWinEnter * silent loadview
map :W :w
map :hex :%!xxd
map :unhex :%!xxd -r
map :js :set filetype=javascript
map :html :set filetype=html
map :xml :set filetype=xml
map :python :set filetype=python
map :cpp :set filetype=cpp
map :w!! :w !sudo tee % > /dev/null
nnoremap Q <nop>
"filetype plugin on
