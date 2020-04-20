" 
" need to change ctags dir 
syntax on
set ts=4
set sw=4
set expandtab
set autoindent
set nu
set relativenumber
set hidden
set noswapfile
set cuc
set cul
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
set cmdheight=2
set updatetime=2
set mouse=a

inoremap jk <ESC>
inoremap kj <ESC>

let mapleader="\<Space>"
" move to the head or tail of a line
map H ^ 
map L $
" buffer change
nnoremap <leader>[ :bp<CR>
nnoremap <leader>] :bn<CR>
nnoremap <C-a> ggVG

" move window
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h

nnoremap <C-n> :noh<CR>

call plug#begin('~/.vim/plugged')

"coc.nvim
" need to install node.js  and npm : node.js version
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 美化界面
" grubox isnot for ssh
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 启动界面
Plug 'mhinz/vim-startify'
" tab分隔符  好像没啥用
Plug 'yggdroot/indentline'

" Plug 'kien/ctrlp.vim'

" operate git 
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
" pairs
Plug 'jiangmiao/auto-pairs'

"目录  prefix key is 'm'   ma  md  ...
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'Blackrush/vim-gocode'

"tagbar
Plug 'majutsushi/tagbar'

"rust 
Plug 'rust-lang/rust.vim'

"Plug 'tell-k/vim-autopep8'

"注释  gcc  gc  gcu
Plug 'tpope/vim-commentary'

"Fuzzy finder need to install fzy and ripgrep
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"
Plug 'easymotion/vim-easymotion'

"syntax
Plug 'neomake/neomake'
"Plug 'dense-analysis/ale'

" neet to instal universion-ctags
"Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-surround'

"format cpp   need to install clang , clangd and clang-format  ( format cpp code)
Plug 'rhysd/vim-clang-format'

"buffer only
Plug 'vim-scripts/BufOnly.vim'
call plug#end()

"scheme
set t_Co=256 

colorscheme gruvbox
"colorscheme solarized
"colorscheme monokai
"colorscheme onedark
set background=dark

"nerdtree
map <leader>n :NERDTreeToggle<CR>

"tagbar
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_width=30
let g:tagbar_ctags_bin="/usr/local/bin/ctags"
let g:tagbar_sort = 0
let g:tagbar_case_insensitive = 1
let g:tagbar_show_visibility = 1
let g:tagbar_show_linenumbers = 1
"airline
" show buffer?
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"coc.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
autocmd CursorHold * silent call CocActionAsync('highlight')
"coc.nvim: Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"nmap <leader>qf  <Plug>(coc-fix-current)
"go-vim
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"rust
let g:rustfmt_autosave=1

"fzf
map <C-p> :Files<CR>
noremap <leader>m :Marks<CR>
"noremap <leader>; :Buffers<CR>

"need to  install ripgrep
noremap <leader>ss :Rg<Space><C-r><C-w><CR>
noremap <leader>ll :BLines<Space><C-r><C-w><CR>
noremap <leader>s<Space> :Rg<Space>
noremap <leader>l<Space> :BLines<Space>
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

"easymotion
nmap <leader>e <Plug>(easymotion-s2)

"neomake
call neomake#configure#automake('nrwi', 500)

let g:neomake_highlight_columns=0
let g:neomake_highlight_lines=0
"
" ale
" let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
" let g:ale_sign_column_always = 1
" let g:ale_set_highlights = 0
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"vim-clang-format
nnoremap <leader>f :ClangFormat<CR>
