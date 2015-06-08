syntax on
colorscheme molokai
set t_Co=256
set autoindent
set tabstop=2
set expandtab
set nocompatible
set number
set termencoding=utf-8
set fileencoding=utf-8
set encoding=utf-8

"twigのシンタックス
autocmd BufNewFile,BufRead *.twig set filetype=htmljinja

"NERDTREEのキーマッピング
nnoremap <silent><C-e> :NERDTreeToggle<CR>

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

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""""""""""""""""""""""""""""""
