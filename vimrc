set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'thinca/vim-localrc'
Plug 'sheerun/vim-polyglot', 'v3.9.2'
Plug 'sjl/gundo.vim', { 'on':  'GundoToggle' }
Plug 'jlanzarotta/bufexplorer' " Need to load this up front or it breaks
Plug 'tpope/vim-fugitive', 'v3.0'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-git', 'vim7.4'
Plug 'tpope/vim-rails', 'v5.4'
Plug 'tpope/vim-characterize', 'v1.0'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake', 'v2.0'
Plug 'tpope/vim-vinegar', 'v1.0'
Plug 'tpope/vim-bundler', 'v2.1'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-db', 'v1.2'
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
Plug 'Shougo/neocomplcache.vim'
Plug 'csexton/trailertrash.vim'
Plug 'Keithbsmiley/investigate.vim'
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
Plug 'airblade/vim-gitgutter', { 'on':  'GitGutterEnable' }
Plug 'fatih/vim-go', 'v1.20'
Plug 'benekastah/neomake'
Plug 'junegunn/vim-easy-align'
Plug 'wellle/targets.vim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/denite.nvim', '3.0'

" experimental
Plug 'terryma/vim-expand-region'
Plug 'airblade/vim-localorie'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'

" colorschemes
Plug 'romainl/Apprentice'
Plug 'cocopon/iceberg.vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'fent/vim-frozen'
Plug 'vyshane/vydark-vim-color'
Plug 'alessandroyorba/despacio'
Plug 'arcticicestudio/nord-vim'

call plug#end()

" Denite
" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
" Buffer Explorer
nnoremap <silent> B :Denite buffer -split=no -highlight-matched-char=None -highlight-matched-range=None<CR>
" Only show buffers in the project
" call denite#custom#source('buffer', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
" Ctrl-P Replacement
call denite#custom#source('file/rec', 'matchers', ['matcher_fuzzy'])
call denite#custom#source('file/rec', 'sorters', ['sorter_rank'])
noremap <silent> <C-p> :Denite file/rec -split=no -highlight-matched-char=None -highlight-matched-range=None<CR>
" Allow arrow keys in file selection
call denite#custom#map(
      \ 'insert',
      \ '<Down>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<Up>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)
" show the prompt as »
call denite#custom#option('_', {
      \ 'prompt': '»',
      \})


" Lightline
let g:lightline = {
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" neocomplcache settings
let g:neocomplcache_disable_auto_complete = 1

" load ftplugins and indent files
filetype plugin indent on

" more trouble than they're worth, really
set nobackup
set noswapfile
" but protect against crash-during-write by saving to a separate file and
" replacing the old
set writebackup

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//

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
set sh=/bin/bash\ -l

" turn on syntax highlighting
syn on

" set default foldmethod
set foldmethod=indent "fold based on indent
set foldnestmax=3 "deepest fold is 3 levels
set nofoldenable "dont fold by default

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

" MAKE IT EASY TO UPDATE/RELOAD vimrc
nnoremap <leader>s :source $HOME/.vim/vimrc<CR>
nnoremap <leader>v :e $HOME/.vim/vimrc<CR>

" quickfix commands
nnoremap <silent> <leader>m :make! "%"<CR>
nnoremap <silent> <leader>n :cn<CR>
nnoremap <silent> <leader>h :cp<CR>
nnoremap <silent> <leader>o :copen<CR>
nnoremap <silent> <leader>p :cclose<CR>

" location list
nnoremap <silent> <leader>k :lopen<CR>
nnoremap <silent> <leader>l :lclose<CR>

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
colorscheme apprentice

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

" tab completion
inoremap <Tab> <C-n>

" Leader-F
let g:Lf_ShortcutF = '<C-F>'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" tilde works like an operator
set tildeop

" don't report trailing spaces on quickfix buffers
let g:trailertrash_blacklist = ['qf']

" when jumping via quickfix or whatever, jump to the first open window that
" contains the specified buffer (if there is one).
set swb=useopen

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" add global projectionist config for golang files
let g:projectionist_heuristics = {
      \ '*.go': {
      \   '*.go': {
      \       'alternate': '{}_test.go',
      \       'type': 'source'
      \   },
      \   '*_test.go': {
      \       'alternate': '{}.go',
      \       'type': 'test'
      \   },
      \ }}


" vim-go settings
" use ctrl-] as normal with ctags
let g:go_def_mapping_enabled = 0
" show test name in quickfix output
let g:go_test_show_name = 1

" Notes!
" Needs to be moved to a Script

let g:notes_dir = "~/Documents/Notes"
let g:notes_extension = "md"
let g:notes_ctags_flags = "--langdef=notes --langmap=notes:." .  g:notes_extension . ' --regex-notes="/^# (.*)$/\1/d,note/"'
let g:notes_index_file = "index.md"

function! UpdateNotesTags()
  " make sure the file is in the notes dir
  if match(bufname("%"), glob(g:notes_dir)) == 0
    call system("(cd " . g:notes_dir . " ; ctags -R " . g:notes_ctags_flags . "; cut -f 1 tags | grep -v \^\!_ > " . g:notes_index_file . ") &")
  end
endfunction

execute "autocmd! BufWritePost " . g:notes_dir . "/*." . g:notes_extension . " call UpdateNotesTags()"
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
