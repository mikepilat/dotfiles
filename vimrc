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
