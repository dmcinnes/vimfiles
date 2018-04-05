set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sjl/gundo.vim', { 'on':  'GundoToggle' }
Plug 'jlanzarotta/bufexplorer' " Need to load this up front or it breaks
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git', 'v6.0'
Plug 'tpope/vim-rails', 'v5.1'
Plug 'tpope/vim-characterize', 'v1.0'
Plug 'vim-scripts/tComment', { 'on':  'TComment' }
Plug 'dmcinnes/ruby_single_test'
Plug 'edsono/vim-matchit'
Plug 'dmcinnes/vim-QuickFixMessage'
Plug 'bogado/file-line'
Plug 'thinca/vim-localrc'
Plug 'int3/vim-extradite'
Plug 'gregsexton/gitv'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sunaku/vim-ruby-minitest'
Plug 'scrooloose/syntastic'
Plug 'joeytwiddle/git_shade.vim'
Plug 'bling/vim-airline'
Plug 'paranoida/vim-airlineish'
Plug 'Shougo/neocomplcache.vim'
Plug 'csexton/trailertrash.vim'
Plug 'Keithbsmiley/investigate.vim'
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
Plug 'airblade/vim-gitgutter', { 'on':  'GitGutterEnable' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake', 'v2.0'
Plug 'tpope/vim-vinegar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'fatih/vim-go'

" colorschemes
Plug 'romainl/Apprentice'
Plug 'cocopon/iceberg.vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'whatyouhide/vim-gotham'
Plug 'ajh17/Spacegray.vim'

call plug#end()

" airline
let g:airline_powerline_fonts = 1
let g:airline_exclude_preview = 1
let g:airline_theme = 'tomorrow'

" neocomplcache settings
let g:neocomplcache_disable_auto_complete = 1

" load ftplugins and indent files
filetype plugin indent on

" more trouble than they're worth, really
set nobackup
set noswapfile

set ts=8
set sw=2

" Set mapleader
let mapleader = ","
let g:mapleader = ","

" Y yanks to end of line, not just yy
map Y y$

" jj acts like escape
imap jj <esc>

" longer history
set history=1000

" make tab completion in command mode work like shell
set wildmenu
set wildmode=longest,list:longest

" complete with current buffer, loaded buffers, unloaded buffers, and tags
set complete=.,b,u,t

" complete using a popup menu, show a preview
set completeopt=menu,preview

" sets the title when run in terminal
" set title

" keeps three lines before/after cursor when scrolling
set scrolloff=3

" shorten messages
set shortmess=atIO

" no tabs in my files boy-o
set expandtab

" search for tags file in parent directories
set tags=tags;/
" support gem tags
set tags+=gems.tags

" sets the shell
" set it to sh for S P E E D
set sh=/bin/bash

" turn on syntax highlighting
syn on

" set default foldmethod
set foldmethod=indent "fold based on indent
set foldnestmax=3 "deepest fold is 3 levels
set nofoldenable "dont fold by default

" BufExplorer
nnoremap <silent> B :BufExplorer<CR>

" QuickBuf
let g:qb_hotkey = "B"

" automatically reload on external file change
set autoread

" allow unsaved hidden buffers
set hidden

" round indents to multiple of shiftwidth
set shiftround

" turn on spell check
set spell

" drop-down menu of spelling suggestions
nnoremap <leader>z a<C-X><C-S>

" MAKE IT EASY TO UPDATE/RELOAD .vimrc
nnoremap <leader>s :source $HOME/.vimrc<CR>
nnoremap <leader>v :e $HOME/.vimrc<CR>

" quickfix commands
nnoremap <silent> <leader>m :make! "%"<CR>
nnoremap <silent> <leader>n :cn<CR>
nnoremap <silent> <leader>h :cp<CR>
nnoremap <silent> <leader>l :cl<CR>
nnoremap <silent> <leader>o :cope<CR>
nnoremap <silent> <leader>p :cclose<CR>

" use vim-dispatch
nnoremap <silent> <leader>M :Make "%"<CR>

" save
noremap <silent> <C-s> :w<CR>

" turn off highlighting
nnoremap <silent> <C-n> :noh<CR>

" move up and down
nnoremap <silent> <C-down> <C-F>
nnoremap <silent> <C-up> <C-B>

" map arrow keys for more natural movement
noremap <silent> <down> gj
noremap <silent> <up> gk

" open Explorer
nnoremap <silent> <C-e> :Exp<CR>

" switch to alternate file
nnoremap <silent> <C-a> :A<CR>

" show matching brackets
set showmatch
set matchtime=2

" bufexplorer - show relative paths
let g:bufExplorerShowRelativePath = 1
" Do not show default help.
let g:bufExplorerDefaultHelp = 0
" Do not go to active window.
let g:bufExplorerFindActive=0

" rails.vim
set suffixesadd=.rb
set includeexpr+=substitute(v:fname,'s$','','g')
"" or you can add substitution pattern s/ies$/y/g, s/ves$/f/g like this:
"" set includeexpr+=substitute(substitute(substitute(v:fname,'s$','','g'),'ie$','y','g'),'ve$','f','g')

" don't show current mode on last line
set nosmd

" console color scheme
" colorscheme lucius_old
" colorscheme Tomorrow-Night
" colorscheme iceberg
colorscheme apprentice

" NERD Tree stuff
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
" change directory to wherever the root is
let NERDTreeChDirMode=2
let NERDTreeDirArrows=0

" make autotag less chatty
let g:autotagVerbosityLevel=-1

" find the current file in the NERD Tree
nnoremap <silent> <C-f> :NERDTreeFind<CR>

" fugitive key bindings
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gn :Gblame<CR>
nnoremap <silent> <leader>gq :Gread<CR>
nnoremap <silent> <leader>ga :Git add %<CR>
nnoremap <silent> <leader>gr :Git reset HEAD %<CR>
" Git grep word under cursor
nnoremap <silent> <leader>f :Ggrep <CR>

" better tcomment map
noremap <silent> <leader>x :TComment<CR>

" lookup word under cursor in dash
nnoremap <silent> <leader>d :Dash!<CR>

" tab completion
inoremap <Tab> <C-n>

" Tagbar Config
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

" single line cucumber execute
nnoremap <silent> <Leader>c :exec "make! --lines " . line(".")<CR>

" Ctrl-P Config
noremap <silent> <C-o> :CtrlPBuffer<CR>

let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
" let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" tilde works like an operator
set tildeop

" Tube
let g:tube_terminal = 'iterm'

" Syntastic
" let g:syntastic_check_on_open = 1 " run syntasic when a file is opened

" don't report trailing spaces on quickfix buffers
let g:trailertrash_blacklist = ['qf']

" when jumping via quickfix or whatever, jump to the first open window that
" contains the specified buffer (if there is one).
set swb=useopen

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

command! -nargs=0 RDocPreview call RDocRenderBufferToPreview()

function! RDocRenderBufferToPreview()
  let filename = substitute(bufname("%"), '\.', '_', 'g') . '.html'
  let rdocoutput = "/tmp/vimrdoc/" . filename
  call system("github-markup " . bufname("%") . " > " . rdocoutput)
  call system("open ". rdocoutput)
endfunction


" ====================
" === AUTOCOMMANDS ===
" ====================

" Objective-C
au! BufRead,BufNewFile *.m set filetype=objc
au! BufRead,BufNewFile *.m set indentexpr=
au! BufRead,BufNewFile *.h set filetype=objc
au! FileType objc set makeprg=/usr/bin/xcodebuild\ -buildstyle\ Development

" Text and Text-like files
au! BufNewFile,BufRead *.txt set filetype=text
au! BufNewFile,BufRead *.txt,*.tex,README setlocal lbr spell
" don't want the status bar on text files by default
au! BufEnter *.txt,*.tex,README setlocal laststatus=1
au! BufLeave *.txt,*.tex,README setlocal laststatus=2

" markdown
au! BufNewFile,BufRead *.md setlocal lbr spell

" ruby
au! BufNewFile,BufRead *.{rbw,gem,gemspec,rjs} setf ruby
au! BufNewFile,BufRead *.{rd,rdoc} setf rdoc
au! BufEnter *.rb match OverLength /\%>80v.\+/
au! BufEnter *.rb highlight OverLength ctermbg=red ctermfg=white guibg=#592929

" rspec
au! BufNewFile,BufRead *_spec\.rb compiler rspec

" cucumber
au! BufNewFile,BufRead *\.feature set makeprg=cucumber\ --format\ progress\ %

" javascript
au! BufNewFile,BufRead *.js setlocal foldmethod=syntax

" arduino
au! BufNewFile,BufRead *.pde,*.ino setlocal ft=c

" go
au! BufNewFile,BufRead *.go setlocal noexpandtab ts=4

" load local vimrc for extra goodness
if filereadable(expand("~/.lvimrc"))
  source ~/.lvimrc
endif
