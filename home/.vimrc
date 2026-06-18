let mapleader   = " "
let g:mapleader = " "

if !has('nvim')
  packadd! comment
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible' " Sensible vim option defaults
Plug 'tpope/vim-sleuth'   " Auto indentation detection
Plug 'junegunn/vim-easy-align' " Alignment. Ex: vipga=

Plug 'tpope/vim-fugitive'     " Git integration

if !has('nvim')
  Plug 'rishi-opensource/vim-claude-code'
endif

Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sainnhe/everforest' " Warm green-based colorscheme
call plug#end()

colorscheme everforest

" " Bundle 'bling/vim-airline'
" " Bundle 'FredKSchott/CoVim'
" " Bundle 'SirVer/ultisnips'
" " Bundle 'Valloric/YouCompleteMe'
" Bundle 'airblade/vim-gitgutter'
" Bundle 'briancollins/vim-jst'
" Bundle 'chriskempson/vim-tomorrow-theme'
" Bundle 'derekwyatt/vim-scala'
" Bundle 'flazz/vim-colorschemes'
" Bundle 'gmarik/vundle'
" Bundle 'rking/ag.vim'
" Bundle 'godlygeek/tabular'
" Bundle 'groenewege/vim-less'
" Bundle 'itspriddle/vim-marked'
" Bundle 'jonathanfilip/vim-lucius'
" Bundle 'kchmck/vim-coffee-script'
" Bundle 'kien/ctrlp.vim'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'mileszs/ack.vim'
" Bundle 'mintplant/vim-literate-coffeescript'
" Bundle 'msp.vim'
" Bundle 'mxw/vim-jsx'
" " Bundle 'jiangmiao/simple-javascript-indenter'
" Bundle 'pangloss/vim-javascript'
" Bundle 'Raimondi/delimitMate'
" Bundle 'scrooloose/nerdtree'
" Bundle 'scrooloose/syntastic'
" Bundle 'slim-template/vim-slim'
" " Bundle 'tomtom/tlib_vim'
" Bundle 'tpope/vim-commentary'
" Bundle 'tpope/vim-cucumber'
" Bundle 'tpope/vim-endwise'
" Bundle 'tpope/vim-fireplace'
" Bundle 'tpope/vim-fugitive'
" Bundle 'tpope/vim-haml'
" Bundle 'tpope/vim-markdown'
" Bundle 'tpope/vim-rails'
" Bundle 'tpope/vim-repeat'
" Bundle 'tpope/vim-surround'
" " Bundle 'uggedal/go-vim'
" Bundle 'vim-ruby/vim-ruby'
" Bundle 'wavded/vim-stylus'
" Bundle 'xhr/vim-io'
" Bundle 'zaiste/tmux.vim'
" 
" Bundle 'garbas/vim-snipmate'
" Bundle 'honza/vim-snippets'
" Bundle 'MarcWeber/vim-addon-mw-utils'
" Bundle 'tomtom/tlib_vim'

" let g:airline_section_a      (the mode indicator)
" let g:airline_section_b      (the fugitive branch indicator)
" let g:airline_section_c      (bufferline or filename)
" let g:airline_section_gutter (syntastic and readonly flag)
" let g:airline_section_x      (filetype)
" let g:airline_section_y      (fileencoding, fileformat)
" let g:airline_section_z      (percentage, line number, column number)
" let g:UltiSnipsJumpBackwardTrigger                      = '<c-k>'
" let g:UltiSnipsJumpForwardTrigger                       = '<c-j>'
" let g:UltiSnipsListSnippets                             = '<c-m>'

let g:jsx_ext_required = 0

let g:airline_enable_fugitive = 1
let g:airline_powerline_fonts = 1
let g:airline_theme           = 'simple'

let g:AutoCloseExpandEnterOn = ""

let g:EasyMotion_leader_key               = ',,'
let g:indent_guides_enable_on_vim_startup = 1
let g:markdown_fenced_languages           = ['io', 'javascript', 'coffee', 'ruby']

" let g:UltiSnipsExpandTrigger = '<c-l>'

let g:ycm_add_preview_to_completeopt                    = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_complete_in_comments                          = 1
let g:ycm_complete_in_strings                           = 1
let g:ycm_min_num_of_chars_for_completion               = 1

let g:SimpleJsIndenter_CaseIndentLevel = 0
let g:SimpleJsIndenter_BriefMode = 1

let javascript_enable_domhtmlcss = 1

let g:syntastic_javascript_checkers = ['jsxhint']

let g:ctrlp_follow_symlinks = 1
let g:ctrlp_max_files       = 0
let g:ctrlp_match_window    = 'bottom,order:btt,min:1,max:50'
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --others --cached --exclude-standard'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

let &t_SI = "\e[6 q" " bar when Starting Insert mode
let &t_EI = "\e[2 q" " block when Ending Insert mode

set nocompatible
set autoread
set encoding=UTF-8

set autoindent
set expandtab
set smarttab
set softtabstop=2
set tabstop=2
set shiftwidth=2 " 2 space indentation as default

set hidden      " buffers become hidden when abandonded
set history=100 " keep 100 lines of command line history
set incsearch   " incrementally search as you type

set list        " display whitespace characters
set listchars=tab:→\ ,trail:•,extends:#,nbsp:.

set nowrap            " no text wrapping
set number
"set numberwidth=6     " set number column width
set signcolumn=yes    " always show sign column
set colorcolumn=80
set ruler             " show the cursor row:col pct%
set cursorline        " highlight the cursor line

set virtualedit=all
set scrolloff=3       " Keep this many lines above/below cursor
set shortmess=at
set sidescroll=1 " minimal number of columns to scroll
set sidescrolloff=15
set backspace=indent,eol,start " allow backspacing over everything in insert mode
" set noesckeys
" set timeoutlen=500 ttimeoutlen=0
set textwidth=0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.DS_Store

set mouse=a
set clipboard=unnamed
set confirm      " confirm save of unsaved files when quitting, etc
set visualbell   " visual bell instead of beep
set showcmd      " display incomplete commands

set ignorecase   " Ignore case when searching by default
set smartcase    " Include case when search contains uppercase
set iskeyword+=- " Include '-' in keyword detection

"set cmdheight=2

set backupdir=~/.vimtmp/,.
set directory=~/.vimtmp/,.
set nobackup
set noswapfile
" set undofile

" set printfont=courier:h8
" set printoptions=number:y,duplex:off,paper:letter,left:20pt,right:20pt


cmap     w!!              w !sudo tee % >/dev/null
imap     jk               <esc>
imap     JK               <esc>
imap     Jk               <esc>
imap     jK               <esc>
inoremap <C-U>            <C-G>u<C-U>
map      ;                :
map      <leader>cC       viw:s/\v%(%(\l)@<=[_-]\|<)(\l)/\u\1/ge<cr>
map      <leader>cc       viw:s/\v%(\l)@<=[_-](\l)/\u\1/ge<cr>
map      <leader>cu       viw:s/\v%(\l)@<=(\u)/_\l\1/ge<cr>
map      <leader>cu       viw:s/\v%(\l)@<=(\u)/-\l\1/ge<cr>
map      \                <nop>
map      Q                gq
nmap     <leader>bi       <leader>rv:BundleInstall<cr>
nmap     <leader>bu       <leader>rv:BundleUpdate<cr>

" use <escape> to exit terminal mode
tnoremap <esc> <C-\\><C-n>

" es6:
map <leader>6i :s/^var \(.\+\) = require('\(.\+\)');\?$/import \1 from '\2'/<cr>
map <leader>6j :s/: /={/eg<cr>:s/,/}/eg<cr>:s/\(\w\+\)({/<\1 /eg<cr>

nnoremap <leader>m        :make<return><return>
nnoremap <leader>1        yypVr=  " Markdown heading 1
nnoremap <leader>2        yypVr-  " Markdown heading 2
nnoremap <leader><space>  :%s/ \+$//eg<return>
nnoremap <leader><tab>    :retab<return>
nnoremap <leader>`        :MarkedOpen<return>
nnoremap <leader>a        vip:sort i<return>
nnoremap <leader>ev       :e $MYVIMRC<return>
nnoremap <leader>eg       :e ~/.gvimrc<return>
nnoremap <leader>es       :e ~/.vim/schemes<return>
nnoremap <leader>et       :e ~/.tmux.conf<return>
nnoremap <leader>gb       :Gblame<return>
nnoremap <leader>gd       :Gdiff<return>
nnoremap <leader>H        :so $VIMRUNTIME/syntax/hitest.vim<return>
nnoremap <leader>k        :<return>
nnoremap <leader>x        :!chmod a+x %<return>
nnoremap <leader>X        :!chmod a-x %<return>
nnoremap <leader>n        :NERDTreeToggle<return>
nnoremap <leader>pi       :PlugInstall<return>
nnoremap <leader>pu       :PlugUpdate<return>
nnoremap <leader>rg       :source ~/.gvimrc<return>
nnoremap <leader>rs       :call ReloadAllSnippets()<return>
nnoremap <leader>rv       :source $MYVIMRC<return>
nnoremap <leader>s        mqHmw<C-w>s`wzt`q<C-w>j`q
vnoremap <leader>sa       :sort i<return>
nnoremap <leader>t:       :Tabularize /[\w']:\zs/l0l1<return>
nnoremap <leader>t<space> :Tabularize/ /l0<return>
nnoremap <leader>t=       :Tabularize /=<return>
nnoremap <leader>tt       :Tabularize /
nnoremap <leader>v        mqHmw<C-w>v`wzt`q<C-w>l`q
nnoremap <leader>w        :set wrap!<cr>
nnoremap <leader>q        :wqa<return>
nnoremap <leader>z        zf}
noremap  ;;               ;

command! W w !sudo tee % > /dev/null

function! StatuslineCurrentHighlight()
  let name = synIDattr(synID(line('.'),col('.'),1),'name')
  if name == ''
    return ''
  else
    return name
  endif
endfunction

" set laststatus=2
set statusline=%7L
set statusline+=\ %3v
set statusline+=\ %{StatuslineCurrentHighlight()}
" set statusline+=%=%{fugitive#head()}
set statusline+=\ %<%r%F\ %h%m%y
set laststatus=2

" hi Al4
" hi Al7
" hi Al9
" hi Al5
" hi Al3
" hi Al2

autocmd VimEnter * wincmd p

autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" autocmd BufRead,BufNewFile *.scss set filetype=scss
autocmd BufRead,BufNewFile *.io set filetype=io
autocmd BufRead,BufNewFile *.s43 set filetype=msp
autocmd BufRead,BufNewFile *.skim set filetype=slim

augroup markdown
  au!
"  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup ENDutocmd CursorHold * checktime

set commentstring=//\ %s

autocmd FileType asm      set commentstring=;\ %s
autocmd BufNewFile,BufRead *.hamlc setf haml
autocmd FileType c        set commentstring=//\ %s
autocmd FileType coffee   set commentstring=#\ %s
autocmd FileType css      set commentstring=/*\ %s\ */
autocmd FileType io       set commentstring=//\ %s
autocmd FileType java     set commentstring=//\ %s
autocmd FileType php      set commentstring=#\ %s
autocmd FileType ruby     set commentstring=#\ %s
autocmd FileType scss.css set commentstring=//\ %s
autocmd FileType sh       set commentstring=#\ %s
autocmd FileType vim      set commentstring=\"\ %s
