" only load this at startup in gvim since it causes character rendering
" issues on the console when first started
let g:neocomplcache_enable_at_startup = 1

colorscheme apprentice

set guifont=Inconsolata\ for\ Powerline:h18,Inconsolata:h18,Courier:h18
set antialias

" turn off toolbar
set guioptions-=T

syn on

" For File Browser
" nnoremap <silent> <D-e> :NERDTreeToggle<CR>

" open Explorer
nnoremap <silent> <D-e> :Exp<CR>

" BufExplorer
nnoremap <silent> <D-b> :BufExplorer<CR>

" Gundo Undo Visualization
nnoremap <F5> :GundoToggle<CR>
nnoremap <D-u> :GundoToggle<CR>

" make
nnoremap <silent> <D-m> :make<CR>

" save
noremap <silent> <D-s> :w<CR>

" turn off highlighting
nnoremap <silent> <D-n> :noh<CR>

" swap current buffer with last seen buffer
nnoremap <silent> <D-l> <C-^>

" MAKE IT EASY TO UPDATE/RELOAD .gvimrc
nnoremap <leader>s :source $HOME/.vimrc<CR>:source $HOME/.gvimrc<CR>
nnoremap <leader>g :e $HOME/.gvimrc<CR>

set completeopt=longest,menuone,preview

" do not show the tabline
" set showtabline=0

" turn off mouseover balloons
set noballooneval

" load local gvimrc for extra love
if filereadable(expand("~/.lgvimrc"))
  source ~/.lgvimrc
endif
