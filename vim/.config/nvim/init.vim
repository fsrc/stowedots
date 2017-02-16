let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

call plug#begin('~/.cache/vim/plugged')


" NERDTree
Plug 'scrooloose/nerdtree'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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

" Commentary
Plug 'tpope/vim-commentary'

" Tmux integration
Plug 'benmills/vimux'

" Git support
Plug 'tpope/vim-fugitive'

" Window navigation with Tmux
"Plug 'christoomey/vim-tmux-navigator'

" Language support
Plug 'kchmck/vim-coffee-script' " coffee-script
Plug 'gkz/vim-ls'		            " livescript
Plug 'satyr/vim-coco'		        " coco

" Plug '~/src/yaflang/yaflang-vim'

" Colorschemes
Plug 'fsrc/lyla-vim'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'     " Don't forget to symlink the colors for lightbar
Plug 'agude/vim-eldar'

call plug#end()

let NERDTreeBookmarksFile=expand("$HOME/.cache/NERDTreeBookmarks")

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

colorscheme lyla

function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <C-g> "vy :call VimuxSlime()<CR>

" Keymapping
nmap <C-e> :NERDTreeToggle<CR>
nmap <C-p> :FZF<CR>
nmap <Leader>c :VimuxPromptCommand<CR>
nmap <Leader>r :VimuxRunLastCommand<CR>
nmap <Leader>p :VimuxTogglePane<CR>
nmap <Leader>z :VimuxZoomRunner<CR>
nmap <C-j> :VimuxScrollDownInspect<CR>
nmap <C-k> :VimuxScrollUp<CR>


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

nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <M-h> <C-w>h

set viminfo='1000,n~/.cache/viminfo
