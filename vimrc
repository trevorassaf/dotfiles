"" VUNDLE CONFIGURATION
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugins
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'mortice/exuberant-ctags'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/UltiSnips'
Bundle 'honza/vim-snippets'
Bundle 'vim-scripts/tcomment'
Bundle 'dandorman/vim-colors'
Bundle 'Lokaltog/vim-powerline'

call vundle#end()
filetype plugin indent on

"" Vim settings
set noswapfile
set nobackup
set listchars=""
set listchars+=trail:.
noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>

"" Remove trailing whitespace
noremap <leader>rtw :%s/\s\+$//e<CR>

"" Highlight brackets
hi MatchParen cterm=bold ctermbg=darkmagenta ctermfg=white

"" Reload .vimrc after editing and saving
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"" Show line
set cursorline

"" Show line numbers
set number

"" Yank to Mac OSX clipboard
set clipboard=unnamed

"" Enable mouse (easier panel switching)
set mouse=a

set noanti
set autoindent
set cindent
set cinoptions=g0.5s,h0.5s
syntax on
set nu
set wrap!
set vb
onoremap p dkp
set scrolloff=5
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set hlsearch

"" Plugin Configurations
" Eclim
let g:EclimCompletionMethod = 'omnifunc'
nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>

" Tagbar
autocmd VimEnter * nested :call tagbar#autoopen(1)
map <Esc><Space> :TagbarToggle<CR>

" NERDTree
au VimEnter * NERDTree
map <Esc><Space> :NERDTreeToggle<CR>

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

function s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif  
endfunction  

autocmd VimEnter * wincmd p

" Ulti Snips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-m>"

"" Colors
set t_Co=256
colorscheme mustang 
