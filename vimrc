execute pathogen#infect()

syntax on
filetype plugin indent on

set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab

set backupdir=/tmp

let g:zenburn_high_Contrast = 1
colorscheme zenburn

" ragtag
let g:ragtag_global_maps = 1 

" nerdtree
map <LEADER>nt :NERDTreeToggle<CR>

" taglist
map <LEADER>tl :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 60

" unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_winheight = 10
let g:unite_prompt = '» '
nnoremap <silent> <C-p> :Unite -silent -start-insert file_rec/async<cr>
nnoremap <silent> <space>b :Unite -silent -start-insert buffer<cr>
