set fenc =utf-8

set nobackup
set noswapfile
set autoread
set hidden 
set showcmd

set number
set relativenumber

set ruler
set title
set cursorline
set virtualedit=onemore
set smartindent
set showmatch
set laststatus=2
set backspace=2
set wildmode=list:longest
set expandtab

set mouse=a

nnoremap j gj
nnoremap k gk 

set clipboard=unnamed,autoselect
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
set whichwrap=b,s,h,l,<,>,[,],~

set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

set shiftwidth=2
set softtabstop=2
set tabstop=2

set ignorecase 
set smartcase 
set incsearch 
set wrapscan 
set hlsearch 

set guioptions-=T
set guioptions+=a
set guioptions-=m
set guioptions+=R

nmap <Esc><Esc> :nohlsearch<CR><Esc>

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END
" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css :set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml :set omnifunc=xmlcomplete#CompleteTags

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'
  let s:lazy_toml = s:rc_dir . '/lazy.toml'
  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

let g:airline_theme = 'wombat'               " テーマの指定
let g:airline#extensions#tabline#enabled = 1 " タブラインを表示
let g:airline_powerline_fonts = 1            " Powerline Fontsを利用

" vim/closing-tag についての設定

let g:cloasetag_filenames = '*.html,*.xhtml,*.jsx,*.tsx,*.erb,*.vue'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.tsx,*.vue'
let g:closetag_xhtml_filenames = '*.xml,*.xhtml,*.jsx,*.tsx,*.vue'
let g:closetag_filetypes = 'html,xhtml,js,ts,jsx,tsx,vue'
let g:closetag_xhtml_filetypes = 'xml,xhtml,js,ts,jsx,tsx,vue'

let g:closetag_emptyTags_caseSensitive = 1

let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
"
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

"Vim/cheatsheetについてのファイル指定

let g:cheatsheet#cheat_file = '~/.vim/.cheatsheet.md'

let g:preview_markdown_parser='mdcat'
let g:preview_markdown_vertical = 1
let g:preview_markdown_auto_update = 1

" ------COC の設定 -----
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-vetur',
  \ 'coc-json',
  \ 'coc-vimtex',
  \ 'coc-python'
  \ ]

" coc-pairs の設定
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" NERDTree の設定

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

syntax enable
syntax on

