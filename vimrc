set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'thinca/vim-localrc'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/gundo.vim', { 'on':  'GundoToggle' }
Plug 'jlanzarotta/bufexplorer' " Need to load this up front or it breaks
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-git', 'vim7.4'
Plug 'tpope/vim-rails', 'v5.4'
Plug 'tpope/vim-characterize', 'v1.0'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake', 'v2.0'
Plug 'tpope/vim-vinegar', 'v1.0'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-db', 'v1.1'
Plug 'vim-scripts/tComment', { 'on':  'TComment' }
Plug 'vim-scripts/matchit.zip'
Plug 'dmcinnes/ruby_single_test'
Plug 'dmcinnes/vim-QuickFixMessage'
Plug 'bogado/file-line'
Plug 'int3/vim-extradite'
Plug 'gregsexton/gitv'
Plug 'sunaku/vim-ruby-minitest'
Plug 'scrooloose/syntastic'
Plug 'joeytwiddle/git_shade.vim'
Plug 'vim-airline/vim-airline', 'v0.9'
Plug 'vim-airline/vim-airline-themes'
Plug 'paranoida/vim-airlineish'
Plug 'Shougo/neocomplcache.vim'
Plug 'csexton/trailertrash.vim'
Plug 'Keithbsmiley/investigate.vim'
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
Plug 'airblade/vim-gitgutter', { 'on':  'GitGutterEnable' }
Plug 'fatih/vim-go'
Plug 'benekastah/neomake'
Plug 'junegunn/vim-easy-align'
Plug 'EinfachToll/DidYouMean'
Plug 'wellle/targets.vim'
Plug 'romainl/vim-qf'
Plug 'Shougo/vimproc.vim', { 'tag' : 'ver.9.3', 'do' : 'make' }
Plug 'Shougo/unite.vim'

" experimental
Plug 'terryma/vim-expand-region'
Plug 'Shougo/denite.nvim'
Plug 'airblade/vim-localorie'

" colorschemes
Plug 'romainl/Apprentice'
Plug 'cocopon/iceberg.vim'
Plug 'chriskempson/vim-tomorrow-theme'

Plug 'fent/vim-frozen'
Plug 'vyshane/vydark-vim-color'
Plug 'alessandroyorba/despacio'

call plug#end()

" Unite
" Buffer Explorer
let g:unite_source_buffer_time_format = ""
nnoremap <silent> B :Unite buffer -no-split<CR>
" Ctrl-P Replacement
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_selecta'])
call unite#custom#source('buffer,file,file_rec', 'sorters', 'sorter_selecta')
noremap <silent> <C-p> :Unite file_rec/async -start-insert -prompt=»\ <CR>

" Denite
" Buffer Explorer
" nnoremap <silent> B :Denite buffer -split=no -mode=normal -highlight-matched-char=None -highlight-matched-range=None<CR>
" Ctrl-P Replacement
" call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy'])
" call denite#custom#source('file_rec', 'sorters', ['sorter_rank'])
" noremap <silent> <C-p> :Denite file_rec -highlight-matched-char=None -highlight-matched-range=None<CR>
"
" call denite#custom#map(
"       \ 'insert',
"       \ '<Down>',
"       \ '<denite:move_to_next_line>',
"       \ 'noremap'
"       \)
" call denite#custom#map(
"       \ 'insert',
"       \ '<Up>',
"       \ '<denite:move_to_previous_line>',
"       \ 'noremap'
"       \)
" call denite#custom#option('_', {
"       \ 'prompt': '»',
"       \})

" Airline
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

" turn off search highlighting
" (which neovim makes a default for some reason)
set nohls

set ts=8
set sw=2

" make vertical split show up on the right for thing like
" :AV (╥﹏╥)
set splitright

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

" make gutentags use ripper-tags for ruby
let g:gutentags_ctags_executable_ruby = 'ripper-tags\ --extra=+q'

" sets the shell
" set it to sh for S P E E D
set sh=/bin/bash\ -l

" turn on syntax highlighting
syn on

" set default foldmethod
set foldmethod=indent "fold based on indent
set foldnestmax=3 "deepest fold is 3 levels
set nofoldenable "dont fold by default

" BufExplorer
"nnoremap <silent> B :BufExplorer<CR>

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
nnoremap <silent> <leader>o :copen<CR>
nnoremap <silent> <leader>p :cclose<CR>

" location list
nnoremap <silent> <leader>k :lopen<CR>
nnoremap <silent> <leader>l :lclose<CR>

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
" Disable mapping.
let g:bufExplorerDisableDefaultKeyMapping=1

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
" ...and with visual selection
vnoremap <silent> <leader>f "gy:Ggrep g<CR>

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
" noremap <silent> <C-o> :CtrlPBuffer<CR>

" don't set the current directory
let g:ctrlp_working_path_mode = 0
" don't show hidden files
let g:ctrlp_show_hidden = 0
" don't reuse old buffers
let g:ctrlp_switch_buffer = 0

" Leader-F
let g:Lf_ShortcutF = '<C-F>'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

" Notes!

let g:notes_dir = "~/Documents/Notes"
let g:notes_extension = "txt"
let g:notes_ctags_flags = "--langdef=notes --langmap=notes:." .  g:notes_extension . ' --regex-notes="/^# (.*)$/\1/d,note/"'
let g:notes_index_file = "index.txt"

function! UpdateNotesTags()
  " make sure the file is in the notes dir
  if match(bufname("%"), glob(g:notes_dir)) == 0
    call system("(cd " . g:notes_dir . " ; ctags -R " . g:notes_ctags_flags . "; cut -f 1 tags | grep -v \^\!_ > " . g:notes_index_file . ") &")
  end
endfunction

autocmd! BufWritePost *.txt call UpdateNotesTags()
execute "set tags+=" . g:notes_dir . "/tags"

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

" rspec
au! BufReadPost,BufNewFile,FileChangedShellPost *_spec.rb setf rspec
au! BufReadPost,BufNewFile,FileChangedShellPost *_spec.rb compiler rspec

" cucumber
au! BufNewFile,BufRead *\.feature set makeprg=cucumber\ --format\ progress\ %

" javascript
au! BufNewFile,BufRead *.js setlocal foldmethod=syntax

" arduino
au! BufNewFile,BufRead *.pde,*.ino setlocal ft=c

" go
au! BufNewFile,BufRead *.go setlocal noexpandtab ts=4

" ColorColumns
au! FileType * match none
" au! FileType ruby match ColorColumn /\%>80v.\+/


" load local vimrc for extra goodness
if filereadable(expand("~/.lvimrc"))
  source ~/.lvimrc
endif
