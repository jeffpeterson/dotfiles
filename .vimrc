let mapleader   = ","
let g:mapleader = ","

set nocompatible

" required! for vundle

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundle 'FredKSchott/CoVim'
Bundle 'airblade/vim-gitgutter'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'uggedal/go-vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'msp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdtree'
Bundle 'SirVer/ultisnips'
Bundle 'slim-template/vim-slim'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-ruby/vim-ruby'
Bundle 'xhr/vim-io'
Bundle 'zaiste/tmux.vim'

let g:AutoCloseExpandEnterOn                            = ""
let g:ctrlp_follow_symlinks                             = 1
let g:EasyMotion_leader_key                             = ',,'
let g:indent_guides_enable_on_vim_startup               = 1
let g:markdown_fenced_languages                         = ['io']
let g:UltiSnipsExpandTrigger                            = '<c-l>'
" let g:UltiSnipsJumpBackwardTrigger                      = '<c-k>'
" let g:UltiSnipsJumpForwardTrigger                       = '<c-j>'
" let g:UltiSnipsListSnippets                             = '<c-m>'
let g:ycm_add_preview_to_completeopt                    = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_complete_in_comments                          = 1
let g:ycm_complete_in_strings                           = 1
let g:ycm_min_num_of_chars_for_completion               = 1

filetype plugin indent on
syntax on

set autoindent
set autoread
set expandtab
set hidden
set history=100 " keep 100 lines of command line history
set incsearch   " do incremental searching
set list
set listchars=tab:..,trail:.,extends:#,nbsp:.
set number
set numberwidth=6
set ruler       " show the cursor position all the time
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set shiftwidth=2
set showcmd     " display incomplete commands
set sidescroll=1
set sidescrolloff=15
set smartcase
set smartindent
set smarttab
set softtabstop=2
set tabstop=2
set textwidth=0
set vb
set virtualedit=all

" set colorcolumn=80

" set pastetoggle=<leader>p

set mouse=a
set clipboard=unnamed


cmap w!! w !sudo tee % >/dev/null
imap jk <esc>`^:s/ \+$//eg<return>`^
imap JK jk
imap Jk jk
imap jK jk
inoremap <C-U> <C-G>u<C-U>
map ; :
map Q gq
map \ <nop>
nmap n nzz
nmap N Nzz
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader><space> :%s/ \+$//eg<return>
nnoremap <leader>= <C-w>=
nnoremap <leader>a vip:sort i<return>
nnoremap <leader>b <leader>r:BundleInstall<return>
nnoremap <leader>H :so $VIMRUNTIME/syntax/hitest.vim<return>
nnoremap <leader>h <<
nnoremap <leader>l >>
nnoremap <leader>m :Tabularize /=<return>
nnoremap <leader>n :NERDTree<return>
nnoremap <leader>R :call ReloadAllSnippets()<return>
nnoremap <leader>r :source $MYVIMRC<return>:source ~/.gvimrc<return>
nnoremap <leader>s mqHmw<C-w>s`wzt`q<C-w>j`q
nnoremap <leader>t :Tabularize /
nnoremap <leader>v mqHmw<C-w>v`wzt`q<C-w>l`q
nnoremap <leader>w :w<return>
nnoremap <leader>z zf}
nnoremap gn gt
nnoremap gp gT
noremap ;; ;

" command WQ wq
" command Wq wq
" command W w
" command Q q
command! W w !sudo tee % > /dev/null


" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

set statusline=%L\ %03v\ %=%<%r%F\ %h%m%y
set laststatus=2

set cursorline

set background=light
colorscheme Tomorrow

" hi ColorColumn ctermbg=7
" hi ColorColumn guibg=Gray
" colorscheme solarized

" hi Directory        cterm=NONE ctermbg=NONE     ctermfg=magenta
" hi IndentGuidesOdd ctermbg=darkred
" hi MatchParen       cterm=NONE ctermbg=NONE     ctermfg=darkred
" hi NERDTreeCWD      cterm=NONE ctermbg=NONE     ctermfg=red
" hi NERDTreeDirSlash cterm=NONE ctermbg=NONE     ctermfg=darkblue
" hi slcolumn         cterm=NONE ctermbg=red      ctermfg=black
" hi Visual           cterm=NONE ctermbg=magenta  ctermfg=lightmagenta
hi CursorLine       cterm=NONE ctermbg=lightgray
hi CursorLineNr     cterm=NONE ctermbg=lightgray  ctermfg=brown guibg=#efefef guifg=#f5871f gui=NONE
hi LineNr           cterm=NONE ctermbg=white      ctermfg=darkgray
hi StatusLine       cterm=NONE ctermbg=darkblue   ctermfg=white  guibg=#f5871f guifg=#ffffff gui=NONE
hi StatusLineNC     cterm=NONE ctermbg=darkcyan   ctermfg=white guibg=#8e908c guifg=#ffffff gui=NONE

set backspace=indent,eol,start " allow backspacing over everything in insert mode

set backupdir=~/.vimtmp/,.
set directory=~/.vimtmp/,.
set nobackup
set noswapfile

set printfont=courier:h8
set printoptions=number:y,duplex:off,paper:letter,left:20pt,right:20pt


autocmd VimEnter * wincmd p

" au BufRead,BufNewFile *.scss set filetype=scss
autocmd BufRead,BufNewFile *.io set filetype=io
autocmd BufRead,BufNewFile *.s43 set filetype=msp
autocmd BufRead,BufNewFile *.skim set filetype=slim

augroup markdown
  au!
"  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup ENDutocmd CursorHold * checktime

set commentstring=//\ %s

autocmd FileType asm      set commentstring=;\ %s
autocmd FileType c        set commentstring=//\ %s
autocmd FileType coffee   set commentstring=#\ %s
autocmd FileType css      set commentstring=//\ %s
autocmd FileType io       set commentstring=//\ %s
autocmd FileType java     set commentstring=//\ %s
autocmd FileType php      set commentstring=#\ %s
autocmd FileType ruby     set commentstring=#\ %s
autocmd FileType scss.css set commentstring=//\ %s
autocmd FileType sh       set commentstring=#\ %s
autocmd FileType vim      set commentstring=\"\ %s
