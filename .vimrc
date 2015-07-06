set autoindent
set tabstop=2
set expandtab
set nocompatible
set relativenumber number
set termencoding=utf-8
set fileencoding=utf-8
set encoding=utf-8
set hlsearch

" .bash like
" but up-down mapped j-k
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Delete>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-l> <C-d>

" vimrc
nnoremap cw ciw
nnoremap dw diw
inoremap <C-w> <ESC>ciw

"twigのシンタックス
autocmd BufNewFile,BufRead *.twig set filetype=htmljinja

"NERDTREEのキーマッピング
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"Uniteのキーマッピング
nnoremap <D-e> :<C-u>Unite file_mru -start-insert<CR>

"vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
"色の設定
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=110
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=140
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

"grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
"
"ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

" ツリー状表示
NeoBundle 'scrooloose/nerdtree'

"インデントを見やすく
NeoBundle 'nathanaelkane/vim-indent-guides'

" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'

" colorscheme(s)
NeoBundle 'tomasr/molokai'

" 補完 
NeoBundle 'Shougo/neocomplete.vim'

" quick-run
NeoBundle 'thinca/vim-quickrun'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""
let mapleader = " "

" Plugin: QuickRun, Quicklaunch & xUnit {{{
let g:quickrun_config = get(g:, 'quickrun_config', {})
"nnoremap <silent> <Leader>r :<C-u>QuickRun -runner vimproc:90 -split 'rightbelow 50vsp'<CR>
nnoremap <silent> <Leader>r :<C-u>QuickRun -runner vimproc:updatetime=10 -split 'rightbelow 50vsp'<CR>

let b:quickrun_config = {
  \   'runner/vimproc' : 90,
  \   'runner/vimproc/updatetime' : 90,
  \ }
let g:quickrun_config = {
  \   '_' : {
  \     'runner/vimproc' : 90,
  \     'runner/vimproc/updatetime' : 90,
  \     'outputter' : 'buffer',
  \   },
  \   'run/vimproc' : {
  \     'exec' : '%s:p:r %a',
  \     'runner' : 'vimproc',
  \     'outputter' : 'buffer',
  \   },
  \ }

" syntax, color
syntax on
colorscheme molokai
set t_Co=256
