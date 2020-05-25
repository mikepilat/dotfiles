syntax on
filetype plugin indent on

set dir=/tmp//

set background=dark

set ruler
set number
set wrap

set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" quality of life
set belloff=all

set undodir=~/.vim/undo
set undofile
set undoreload=10000

set updatetime=300
set signcolumn=yes

map <silent> <LocalLeader>nh :nohls<CR>

" nerdtree
map <silent> <Leader>nt :NERDTreeToggle<CR>
map <silent> <Leader>nf :NERDTreeFind<CR>
let g:NERDTreeIgnore=['^_build$[[dir]]']

" vim-test + vimux
let g:test#strategy = 'vimux'
let g:test#preserve_screen = 0
let g:VimuxOrientation = 'h'
let g:VimuxHeight = '40'
nnoremap <silent> <leader>rf :wa<CR>:TestNearest<CR>
nnoremap <silent> <leader>rb :wa<CR>:TestFile<CR>
nnoremap <silent> <leader>ra :wa<CR>:TestSuite<CR>
nnoremap <silent> <leader>rl :wa<CR>:TestLast<CR>


function! GitGrepWord()
  cgetexpr system("git grep -n '" . expand("<cword>") . "'")
  cwin
  echo 'Number of matches: ' . len(getqflist())
endfunction
command! -nargs=0 GitGrepWord :call GitGrepWord()
nnoremap <silent> <Leader>gw :GitGrepWord<CR>

" ale
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'purescript': ['purty'],
      \   'typescript': ['prettier'],
      \}

let g:ale_fix_on_save = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 0
let g:ale_linters_explicit = 1

" coc
let ls_langs = 'elixir'
execute 'autocmd Filetype ' . ls_langs . ' inoremap <silent><expr> <C-X><C-O> coc#refresh()'
execute 'autocmd Filetype ' . ls_langs . ' nmap <C-]> <Plug>(coc-definition)'
execute 'autocmd Filetype ' . ls_langs . ' nnoremap <silent> K :call CocAction(''doHover'')<CR>'
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <c-space> coc#refresh()

" fzf
let $FZF_DEFAULT_COMMAND = 'find * -type f 2>/dev/null | grep -v -E "deps\/|_build\/|node_modules\/|vendor\/|build_intellij\/|output\/"'
let $FZF_DEFAULT_OPTS = '--reverse'
let g:fzf_tags_command = 'ctags -R --exclude=".git" --exclude="node_modules" --exclude="vendor" --exclude="log" --exclude="tmp" --exclude="db" --exclude="pkg" --exclude="deps" --exclude="_build" --exclude="output" --extra=+f .'
map <silent> <leader>ff :Files<CR>
map <silent> <leader>fg :GFiles<CR>
map <silent> <leader>fb :Buffers<CR>
map <silent> <leader>ft :Tags<CR>
map <silent> <LocalLeader>rt :!ctags -R --exclude=".git" --exclude="node_modules" --exclude="vendor" --exclude="log" --exclude="tmp" --exclude="db" --exclude="pkg" --exclude="deps" --exclude="_build" --extra=+f .<CR>
