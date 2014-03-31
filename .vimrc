"vunlde.vimで管理してるpluginを読み込む
 source ~/dotfiles/.vimrc.bundle
 source ~/dotfiles/.vimrc.basic
 source ~/dotfiles/.vimrc.statusline
 source ~/dotfiles/.vimrc.indent
 source ~/dotfiles/.vimrc.apperance
 source ~/dotfiles/.vimrc.completion

filetype plugin indent on     " required!
filetype indent on
syntax on

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
