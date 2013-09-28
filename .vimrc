set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
set lcs=tab:>.,trail:_,extends:\
set list
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /　/

set expandtab
" splitで開く場合は右に開く
set splitright

" netrwは常にtree view
let g:netrw_liststyle = 3
" CVSと.で始まるファイルは表示しない
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1

set nocompatible               " be iMproved
filetype off

" NeoVundle settings Start

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'taichouchou2/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}

filetype plugin indent on     " required!
filetype indent on
syntax on

" NeoVunble End

" インクリメンタルサーチ
set incsearch

" タブ空白変換
set expandtab
" タブ幅
set tabstop=4

" :でタブを押すと候補が横に表示される
set wildmenu
" 常に行番号を表示
set number

"" ステータスラインを常に表示（編集中のファイル名が常に確認できるようになる）
set laststatus=2
"" ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set clipboard=unnamed

map <C-p>   :Vexplore<CR>
"" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
