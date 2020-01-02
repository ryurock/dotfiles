"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  let s:toml = '~/.config/.dein.toml'
  call dein#load_toml(s:toml, {'lazy': 0})

  " その他インストールしていないものはこちらに入れる
  if dein#check_install()
    call dein#install()
  endif

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

"End dein Scripts-------------------------

" 貼付けモードにしてautoインデントを無効にする
set paste
set noautoindent
set nosmartindent

set ignorecase
set smartcase
set wrapscan
set incsearch

" INSERT時にバックスペースをバックスペースとして動作させる。see http://qiita.com/omega999/items/23aec6a7f6d6735d033f
set backspace=2
" vimに行番号を表示させる
set number
" スワップファイル作らない
set noswapfile
" バックアップ取らない
set nobackup
" スクロール時の余白確保 see http://d.hatena.ne.jp/hyuki/20131206/vim
set scrolloff=3
" 一行に長い文章を書いていても自動折り返しをしない
set textwidth=0
" ビープをならさない
set vb t_vb=

" QuickFixListのプレビューを利用できるにする
set modifiable

" color-scheme
syntax on
set background=dark
colorscheme hybrid




""""""""""""""""""""""""""""""
" タブ・空白特殊文字表示・見え方など
""""""""""""""""""""""""""""""

" タブ文字を CTRL-I で表示し、行末に $ で表示する。（有効:list/無効:nolist）
set list

" タブ文字などの表示の見え方の設定
set lcs=tab:>.,trail:_,extends:\

" SpecialKey see http://rcmdnk.github.io/blog/2014/07/22/computer-vim/#specialkey
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7

" 全角スペースを表示
" see http://inari.hatenablog.com/entry/2014/05/05/231307
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" タブ空白変換
set expandtab




""""""""""""""""""""""""""""""
" バッファの設定
""""""""""""""""""""""""""""""
" 外部で変更のあったファイルを自動的に読み直す
" see http://vim-jp.org/vim-users-jp/2011/03/12/Hack-206.html
set autoread
" ファイルの自動読み直しの設定でInsertモードに切り替わった時とウィンドウが移動した時にファイルを読み直すようにする
if has("autocmd")
  augroup vimrc-checktime
    autocmd!
    autocmd InsertEnter,WinEnter * checktime
  augroup END
endif " has("autocmd")


""""""""""""""""""""""""""""""
" Exploreの設定
""""""""""""""""""""""""""""""
" netrwは常にtree view
let g:netrw_liststyle = 3

"画面最後の行をできる限り表示する。
set display+=lastline


""""""""""""""""""""""""""""""
"ステータスライン
""""""""""""""""""""""""""""""
" ステータスラインを常に表示
set laststatus=2

" ステータスラインにエラーメッセージを追加する
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

if !has('gui_running')
  set t_Co=256
endif

" lightlineの設定
let g:lightline = {
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ },
        \ 'component_expand': {
        \   'syntastic': 'SyntasticStatuslineFlag'
        \ },
        \ 'component_type': {
        \   'syntastic': 'error'
        \ }
        \ }

let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:p') ? expand('%:p') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" lightlineの設定 End ----------------------


""""""""""""""""""""""""""""""
"カーソル
""""""""""""""""""""""""""""""
" カーソル行をハイライト
set cursorline
hi clear CursorLine
hi CursorLineNr term=bold cterm=NONE ctermfg=228 ctermbg=NONE

"カーソルが何行目の何列目に置かれているかを表示する
set ruler

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

""""""""""""""""""""""""""""""
"入力補完
""""""""""""""""""""""""""""""
" :でタブを押すと候補が横に表示される
set wildmenu

" コマンド補完を開始するキー
set wildchar=<tab>

" リスト表示，最長マッチ
set wildmode=list:full

" コマンド・検索パターンの履歴数
set history=1000


""""""""""""""""""""""""""""""
"キーマップ
""""""""""""""""""""""""""""""
" prefix keyの設定
nmap <Space> [unite]
" スペースキーとfキーでバッファと最近開いたファイル一覧を表示
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer file_mru<CR>
" スペースキーとeキーでVimfilerの起動
nnoremap <silent> <Space>f :<C-u>VimFiler<CR>
" スペースキーとcキーでset pasteの実行
nnoremap <silent> <Space>c :<C-u>set<Space>paste<CR>
" スペースキーとvキーでset nopasteの実行
nnoremap <silent> <Space>v :<C-u>set<Space>nopaste<CR>


""""""""""""""""""""""""""""""
" インデント Indent
""""""""""""""""""""""""""""""
set smartindent  " 新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。

" softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set tabstop=2 shiftwidth=2 softtabstop=0

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off

  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
endif