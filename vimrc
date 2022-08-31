

call plug#begin('~/.vim/plugged')

Plug 'thinca/vim-localrc'
Plug 'sheerun/vim-polyglot'
Plug 'sjl/gundo.vim', { 'on':  'GundoToggle' }
Plug 'jlanzarotta/bufexplorer' " Need to load this up front or it breaks
Plug 'tpope/vim-fugitive', { 'tag': 'v*' }
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-git', { 'tag': 'vim*' }
Plug 'tpope/vim-rails', { 'tag': 'v*' }
Plug 'tpope/vim-characterize', { 'tag': 'v*' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake', { 'tag': 'v*' }
Plug 'tpope/vim-vinegar', { 'tag': 'v*' }
Plug 'tpope/vim-bundler', { 'tag': 'v*' }
Plug 'tpope/vim-rbenv'
Plug 'vim-scripts/tComment', { 'on':  'TComment' }
Plug 'vim-scripts/matchit.zip'
Plug 'dmcinnes/ruby_single_test'
Plug 'dmcinnes/vim-QuickFixMessage'
Plug 'bogado/file-line'
Plug 'int3/vim-extradite'
Plug 'gregsexton/gitv'
Plug 'sunaku/vim-ruby-minitest'
Plug 'scrooloose/syntastic', { 'tag': '*' }
Plug 'joeytwiddle/git_shade.vim'
Plug 'Shougo/neocomplcache.vim'
Plug 'csexton/trailertrash.vim'
Plug 'Keithbsmiley/investigate.vim'
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
Plug 'airblade/vim-gitgutter' ", { 'on':  'GitGutterEnable' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'benekastah/neomake'
Plug 'junegunn/vim-easy-align'
Plug 'wellle/targets.vim'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'

" experimental
Plug 'terryma/vim-expand-region'
Plug 'airblade/vim-localorie'
Plug '/usr/local/opt/fzf'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'kana/vim-textobj-user', '0.7.6'
Plug 'tek/vim-textobj-ruby'

" colorschemes
Plug 'romainl/Apprentice'
Plug 'adlawson/vim-sorcerer'

call plug#end()

" Lightline
let g:lightline = {
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" neocomplcache settings
let g:neocomplcache_disable_auto_complete = 1

" Start CtrlP from cwd
let g:ctrlp_working_path_mode = 'rw'

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
set sh=/bin/zsh\ -l

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

" Buffer Explorer
nnoremap <silent> B :BufExplorer<CR>

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

" don't change directories when opening files from external
set noautochdir

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
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gl :Gclog<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>gn :Git blame<CR>
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

" fat-fingered :w
" -- so it doesn't think I want :Windows in fzf
cmap W w

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
" also group the imports section on save
let g:go_fmt_command = "goimports"

" reduce updatetime to 100ms
" so git-gutter can updates are quick
set updatetime=100

" Hide things link markdown links unless the cursor is over them
set conceallevel=2

" markdown configuration
let g:vim_markdown_follow_anchor = 1

" Notes!
" Needs to be moved to a Script
"
" requires universal-ctags https://github.com/universal-ctags/ctags
"
" Define a config file in your notes directory:
" --langdef=markdowntags
" --languages=markdowntags
" --langmap=markdowntags:.md
" --kinddef-markdowntags=t,tag,tags
" --mline-regex-markdowntags=/(^|[[:space:]])@([a-zA-Z0-9_-]+)/\2/t,tag/{mgroup=1}

let g:notes_dir = "~/Documents/Notes"
let g:catalog_extension = "md"

function! UpdateNotesTags()
  " make sure the file is in the notes dir
  if stridx(expand("%:p:h"), glob(g:notes_dir)) == 0
    " update tags
    call system("(cd " . g:notes_dir . " ; ctags -R) &")
    " recreate referrals
    " 1. find the referral blocks and remove them from the end of the files
    " 2. find references in the tags file that look like links
    " 3. remove the second :
    " 4. take only the filename and the link and reverse them
    " 5. drop any web links
    " 6. sort
    " 6. dump each filename on the end of the linked note with a referral
    " header
"    call system("(cd " . g:notes_dir . ' ; find . -type f | xargs -I % vim -e -c ''g/^## Referrals$/.-1,$d'' -c ''wq'' % ; grep --exclude-dir .ctags.d -o -n -R "\[[^]]*\]([^)]*" . | sed -E "s/:([0-9]+):/:\1/" | awk -F ''[[(]'' ''{print $3,$1}'' | grep -v "^http" | sort | xargs -L 1 sh -c ''echo "\n## Referrals\n$1" >> ./$0'') &')
  end
endfunction

execute "autocmd! BufWritePost " . g:notes_dir . "/*." . g:catalog_extension . " call UpdateNotesTags()"
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
