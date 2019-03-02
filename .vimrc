set nu
set hlsearch
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
set tags=tags;/
set iskeyword=@,45,48-57,58,_,192-255,#
set colorcolumn=81,111 " absolute columns to highlight "
set colorcolumn=+1,+21 " relative (to textwidth) columns to highlight "
syn match tab display "\t"
hi link tab Error
" set csto=1
set autoindent
set smartindent " return ending brackets to proper locations
set paste
set wrap " turn on visual word wrapping
set expandtab " expand tabs into spaces
set softtabstop=4 " indentation level of soft tabs
set tabstop=4 " indentation level of tabs
set shiftwidth=4 " how many columns to re-insert with << and >>
set showmatch " show matching brackets
set ruler " show cursor position at all times
" allow backspacing over everything in insert mode
" set backspace=indent,eol,start

"cscop"
"" mappings
" F3 search for symbols
" F4 search for definitions
" F5 search for functions calling the current function
" F6 search for functions called by this function
nmap <F3> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F4> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <F5> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <F6> :cs find d <C-R>=expand("<cword>")<CR><CR>
" http://vimdoc.sourceforge.net/htmldoc/syntax.html

" Highlight "bad" spaces
let c_space_errors=1

" Also highlight empty lines at EOF.
match ErrorMsg /\s\+$\| \+\ze\t/

" Enable incremental search.
set incsearch

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Bundle 'phleet/vim-arcanist'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ctrl-p config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'

if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb " add any database in current directory, if not keep going upwards in the directory tree until you find a cscope.out file

  if $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  else
    let dir = getcwd()
    while dir != ""
      let f = dir . "/cscope.out"
      if filereadable (f)
        execute "cs add " . f
        break
      endif
      let dir = substitute (dir, "/[^/]*$", "", "")
    endwhile
  endif

  set csverb
endif

set pastetoggle=<leader>p

" ctags
" Ctrl+\ - Open the definition in a new tab
" Alt+] - Open the definition in a vertical split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" See filename in status
set laststatus=2
set statusline="%F%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"

" shortcut to edit another file in same directory
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" Navigate VIM windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" don't use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" really, just don't
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
