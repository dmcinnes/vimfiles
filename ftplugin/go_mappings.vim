if exists("b:my_go_mappings")
  finish
endif
let b:my_go_mappngs = 1

nnoremap <silent> <leader>m :GoTest<CR>
nnoremap <silent> <leader>. :GoTestFunc<CR>
