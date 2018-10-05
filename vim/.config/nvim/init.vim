let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

call plug#begin('~/.vim/plugged')

" NERDTree
Plug 'scrooloose/nerdtree'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

" Built in terminal
Plug 'kassio/neoterm'

" Cross file grep
Plug 'mhinz/vim-grepper'

" Send commands to term
Plug 'jalvesaq/vimcmdline'

" Cross file search
Plug 'brooth/far.vim'

" Status line
Plug 'itchyny/lightline.vim'

" Github activities
Plug 'junegunn/vim-github-dashboard'

" Tabular aligning
Plug 'godlygeek/tabular'

" Easy align
Plug 'junegunn/vim-easy-align'

" Colorscheme changer
Plug 'xolox/vim-colorscheme-switcher'

" Dasherize and other simplifiers
Plug 'farfanoide/inflector.vim'

" TAGS
set tags=./tags;/
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/TagHighlight'

" Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
" let g:easytags_dynamic_files = 1
" let b:easytags_cmd = '/usr/bin/ctags'

" Commentary
Plug 'tpope/vim-commentary'

" Git support
Plug 'tpope/vim-fugitive'

" Git support
Plug 'digitaltoad/vim-pug'

" Language support
Plug 'sheerun/vim-polyglot'
Plug 'lfe-support/vim-lfe'
" Plug 'kchmck/vim-coffee-script' " coffee-script
" Plug 'gkz/vim-ls'		            " livescript
" Plug 'satyr/vim-coco'		        " coco
" Plug 'satyr/vim-json'		        " JSON

Plug '~/src/yaflang/yaflang-vim'

" Colorschemes
Plug 'fsrc/lyla-vim'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'     " Don't forget to symlink the colors for lightbar
Plug 'agude/vim-eldar'
Plug 'goirijo/vim-jgg-colorscheme'

call plug#end()

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

colorscheme jgg

" Keymapping
nmap <C-e> :NERDTreeToggle<CR>
nmap <C-p> :FZF<CR>


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let NERDTreeIgnore=['node_modules', '\.log$', 'README']

" Set correct syntax highlighting for TOL
autocmd BufNewFile,BufRead *.tol   set syntax=lisp

" Remove anoying trailing whitespaces on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType ruby,python,js,coffee,ls,co,vim autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

set splitbelow
set splitright

nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Ctrl-S to save
nnoremap <C-S> :w<CR>

nnoremap <C-c> :LiveScriptCompile<CR>
vmap <C-c> :LiveScriptCompile<CR>

" Lightline
set laststatus=2
set noshowmode

function! HeadOfPath()
  return expand('%:p:h:t')
endfunction

let g:lightline = {
  \ 'colorscheme': 'Dracula',
  \ 'active' : {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'filename', 'path', 'modified', 'helloworld' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
  \ },
  \ 'component': {
  \   'charvaluehex': '0x%B',
  \   'path': "expand('%:p:h:t')"
  \ },
  \ 'component_function': {
  \   'path': 'HeadOfPath'
  \ },
  \ }


