" --- REQUIREMENTS {{{
" Compile: cd ~/.vim/bundle/YouCompleteMe; ./install.py --clang-completer
" --system-clang; to
"          compile ycm
" Package: the_silver_searcher / ag has to be installed to use ag
" Package: powerline-fonts
" Package: python-isort (import sorter for python)
" Packages: formaters for auto format (yapf, astyle)
" Packages: lint tools used for needed languages (javac, gcc, flake8)
" Packages: ctags (for tagbar)
" Plugin Manager: Vundle (install with git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim)
" Color Scheme: Molokai (git clone https://github.com/tomasr/molokai.git
" ~./vim/colors)
" Set shell to bash to prevent problems with plugins
set shell=bash
set nocompatible " disable vi compatibility mode
filetype off
" }}}

" --- PLUGINS {{{
" include vundel in runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle handle itself
Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'w0rp/ale'
Plugin 'Chiel92/vim-autoformat'
Plugin 'fisadev/vim-isort'
Plugin 'Valloric/YouCompleteMe'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'Valloric/ListToggle'
Plugin 'godlygeek/tabular'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/MatchTagAlways'
Plugin 'chriskempson/base16-vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'rakr/vim-one'
Plugin 'pangloss/vim-javascript'
Plugin 'reedes/vim-colors-pencil'
" --- END PLUGINS ---
call vundle#end()
filetype plugin indent on
" }}}

" --- GENERAL {{{
" default to utf8
set encoding=utf-8
" enable backups
set backup
set writebackup
" move backups to /tmp
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" enable modelines
set modelines=1
" enable mouse scrolling
set mouse=a
" allow to hide unsaved buffers
set hidden
" }}}

" --- KEY BINDINGS {{{
" change <leader> to comma
let mapleader = ","
" also go down to lines which are only visually split
nnoremap j gj
nnoremap k gk
" split movements
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" buffer movements
nnoremap <leader>T :enew<CR>
nnoremap <leader>k :bp<CR>
nnoremap <leader>j :bn<CR>
" save session
nnoremap <leader>s :mksession!<CR>
" lead shortcut for ctrlp
nnoremap <leader>p :CtrlP<cr>
" shorcut for ack / ag search
nnoremap <leader>a :Ack<space>
" shortcut for gundo
nnoremap <leader>uu :GundoToggle<CR>
" NerdTree toggle
nnoremap <leader>t :NERDTreeToggle<CR>
" NERDCOmmenter Toggle
nnoremap <leader># :call NERDComment(0, "toggle")<CR>
inoremap <leader># <C-o>:call NERDComment(0,"toggle")<C-m>
" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q
" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q
" auto format code
nnoremap <leader>f :Autoformat<CR>
" quick run shortcut
nnoremap <F5> :call <SID>compile_and_run()<CR>
" ToggleTagbar
nmap <F8> :TagbarToggle<CR>
" tabularize shortcuts
nnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a: :Tabularize /:\zs<CR>
vnoremap <leader>a: :Tabularize /:\zs<CR>
autocmd FileType markdown inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a
" }}}

"  --- UI CONFIG {{{
" color theme to molokai
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
let base16colorspace=256
set t_Co=256
set background=light
colorscheme base16-tomorrow
"let g:molokai_original = 1
"let g:rehash256 = 1
" show line numbers
set number
" show last command
set showcmd
" show tab menu for completition
set wildchar=<Tab>
set wildmode=full:list
set wildmenu
" let vim redraw less e.g. for macros
set lazyredraw
" show matching () [] {}
set showmatch
"enable folding
set foldenable
" show folds by default
set foldlevelstart=10
" allow for a max of 10 nested folds
set foldnestmax=10
" open/close folds shortcut
nnoremap <space> za
" fold using indents
set foldmethod=indent
" always show statusline
set laststatus=2
" set split default positions
set splitright
set splitbelow
set go-=m
set go-=r
set go-=T
" }}}

" --- SYNTAX {{{
" enable syntax highjighting
syntax enable
" set tabs to 4 spaces
set tabstop=4
set softtabstop=4
" expand tabs into spaces
set expandtab
" set >> and << commands to 4 spaces
set shiftwidth=4
" indent when moving to the next line while writing code
set autoindent
" filetype based indents
filetype indent on
" enable python highlighting features
let python_highlight_all = 1
" }}}

" --- SEARCH {{{
" highlight text while searching
set hlsearch
" search while typing
set incsearch
" turn off search highlights
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" --- PLUGIN SETTINGS {{{
" ack.vim
let g:ackprg = 'ag --vimgrep --smart-case'
" ctrlp.vim
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='pencil'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
" NERDCommenter
let g:NERDSpaceDelims = 1 "Space after comment symbol
" ale
let g:ale_linters = {'python': ['flake8', 'mypy', 'pylint'], 'markdown': ['mdl'], 'java': ['javac'], 'html': ['htmlhint', 'tidy'], 'yaml': ['yamllint'],}
" vim-autoformat
let g:formatters_python = ['yapf']
" vim-isort
let g:vim_isort_python_version = 'python3'
" ycm
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
" ListToggle
let g:lt_location_list_toggle_map = '<leader>ll'
let g:lt_quickfix_list_toggle_map = '<leader>q'
" UltiSnips
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets= "<leader>sp"
" MatchTagAlways
let g:mta_filetypes = { 'html' : 1, 'xhtml' : 1, 'xml' : 1, 'jinja' : 1, 'htmldjango' : 1 }
" vim-javascript
let g:javascript_plugin_jsdoc = 1
" }}}

" --- FILETYPE SETTINGS {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" django file recognition
au BufNewFile,BufRead admin.py     setlocal filetype=python.django
au BufNewFile,BufRead urls.py      setlocal filetype=python.django
au BufNewFile,BufRead models.py    setlocal filetype=python.django
au BufNewFile,BufRead views.py     setlocal filetype=python.django
au BufNewFile,BufRead settings.py  setlocal filetype=python.django
au BufNewFile,BufRead forms.py     setlocal filetype=python.django
" }}}

" --- CUSTOM FUNCTIONS {{{
" compile/run function
function! s:compile_and_run()
    exec 'w'
    if &filetype == 'python'
        exec "AsyncRun! python %"
    elseif &filetype == 'sh'
        exec "AsyncRun! time bash %"
    elseif &filetype == 'java'
        exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'c'
        exec "AsyncRun! gcc -o %< %; ./%<"
    elseif &filetype == 'cpp'
        exec "AsyncRun! gcc -o %< %; ./%<"
    endif
endfunction

augroup SPACEVIM_ASYNCRUN
    autocmd!
    " automaticaly open quickfix window on run
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
augroup END

" auto tabularize pipes
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"  }}}

" --- vim.rc settings ---
" vim:foldmethod=marker:foldlevel=0
