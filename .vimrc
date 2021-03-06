" ------------ 文字コードなど
" Vim内部で使う文字コード
set encoding=utf-8

" このファイルの文字コード
scriptencoding utf-8

" ファイルを開くときの文字コードの候補
set fileencodings=utf-8,cp932,sjis,utf-16le

" ファイルを開くときの改行コードの候補
set fileformats=unix,dos

" ウインドウの幅
set columns=120

" ウインドウの高さ
set lines=50

" ------------ pathogen用
" pathogenの準備
execute pathogen#infect()
execute pathogen#helptags()


" ------------ ファイルタイプ
" ファイルタイプを検出して、それに応じて構文ハイライト
syntax enable
filetype plugin indent on


" ------------ 配色
set t_Co=256
set background=dark
colorscheme torte


" ------------ 概観
" ステータスライン(2: 常に表示)
set laststatus=2

" カーソル位置を表示
set ruler

" モードを表示
set showmode

" 入力途中の呪文を表示
set showcmd

" 行番号を表示
set number

" コマンドラインモードの補完機能をリッチに
set wildmenu

" 不可視文字の可視化
"set list listchars=tab:»\ ,eol:¬,trail:∙
"set list listchars=tab:»\ ,eol:｣,trail:∙
set list listchars=tab:»\ ,eol:↲,trail:∙

" ------------ インデント
" デフォルトで4
" ruby, clojure, markdownなら2
" タブはスペースに展開
set shiftwidth=0 softtabstop=0 tabstop=4 expandtab
augroup vimrc_tab
    autocmd!
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType clojure setlocal tabstop=2
    autocmd FileType markdown setlocal tabstop=2
augroup END
let g:vim_indent_cont=8


" ------------ 検索
" デフォルトはmagicモード
set magic

" デフォルトは大文字小文字を無視
set ignorecase

" 賢く大文字小文字を区別
set smartcase

" インクリメンタルサーチ
set incsearch

" すべてのマッチ箇所をハイライト
set hlsearch

" ファイル端に達しても、一周して検索を続行
set wrapscan


" ------------ スペルチェック
" 英語
set spelllang=en,cjk
" デフォルトでOFF
set nospell


" ------------ Vimが自動的に作るファイル
" アンドゥ履歴ファイルを作らない
set noundofile
" バックアップファイルを作る
set backup
" Swapファイル(自動保存ファイル)を作らない
set noswapfile
" バックアップファイルの置き場
if ( has('win32') || has('win64') )
    set backupdir=$TEMP
else
    set backupdir=/tmp
endif


" ------------ その他のオプション
" 未保存のバッファが隠れるのを許す
set hidden

" 挿入モード時のIME制御(0: IME OFF)
set iminsert=0
inoremap <Esc> <Esc>:set iminsert=0<CR>

" 自動インデント
set autoindent

" <C-a>や<C-x>の対応基数
set nrformats-=octal

" 自動改行(0: しない)
set textwidth=0


" ------------ VimScript用
augroup vimrc
    autocmd!

    " Kしたときに使うプログラム
    autocmd FileType vim setlocal keywordprg=:help
augroup END


" ------------ CtrlP用
" let g:ctrlp_map='<Leader>o'
let g:ctrlp_cmd='CtrlPMixed'
let g:ctrlp_prompt_mappings={
        \ 'PrtExit()': ['<esc>', '<c-c>', '<c-g>', '<c-q>']
        \ }


" ------------ UltiSnips用
let g:UltiSnipsSnippetsDir=expand("$HOME/dotfiles/.vim/UltiSnips")



" ------------ キーマッピング ------------
" ------------ Leader
let mapleader=","
nnoremap \ ,

" ------------ ファイルを開く/閉じる/保存する
nnoremap <Leader>ev :e ~/dotfiles/.vimrc<CR>
nnoremap <Leader>gv :e ~/dotfiles/.gvimrc<CR>
nnoremap <Leader>cv :e ~/dotfiles/cheatsheets/vim.txt<CR>
nnoremap <Leader>E :Explore<CR>
nnoremap <Leader>S :Sexplore<CR>
nnoremap <Leader>V :Vexplore<CR>
nnoremap <Leader>m :MRU<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

" ------------ カーソル移動
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j
xnoremap k gk
xnoremap j gj
xnoremap gk k
xnoremap gj j

" ------------ 検索
nnoremap <Leader>gg :vim //j <C-r>=expand('%:h').'/**'<CR> <CR>:copen 8<CR><C-w>J
nnoremap <Leader>gG :vim //j <C-r>=expand('%:h').'/../**'<CR> <CR>:copen 8<CR><C-w>J
nnoremap <Leader>q :copen 8<CR>
nnoremap <C-l> :nohlsearch<CR><C-l>

" ------------ 折り畳み
nnoremap <Space> zA

" ------------ スペルチェック
function! s:toggleSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax enable
    endif
endfunction
nnoremap <Leader>s :set invspell<CR>:call <SID>toggleSyntax()<CR>

" ------------ コピペ
set pastetoggle=<F2>
inoremap <C-g><C-v> <F2><C-r>"<F2>

" ------------ コマンドラインモード
cnoremap <expr> %% getcmdtype()==':' ? expand('%:p:h').'/' : '%%'

" ------------ EasyMotion
"let g:EasyMotion_do_mapping=0
"nmap <C-f> <Plug>(easymotion-overwin-f)

" ------------ BufExplorer
" let g:bufExplorerShowDirectories=0
" let g:bufExplorerShowUnlisted=0
" let g:bufExplorerSortBy='fullpath'
" nnoremap <Leader>l :BufExplorerHorizontalSplit<CR>

" ------------ TagBar
" nnoremap <Leader>t :TagbarOpenAutoClose<CR>
" nnoremap <Leader>T :echo tagbar#currenttag('[%s]', 'No tags')<CR>

" ------------ 無視
nnoremap q: <Nop>



" ------------ 環境独自の設定ファイル ------------
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
" --- REPL
"command Repl !start cmd.exe /c cd /d "%:h"&& lein.bat repl
command! Repl !start powershell.exe -command "cd %:h;lein.bat repl"
"command Clj !start powershell.exe -command "cd %:h;clj -R:nREPL -m nrepl.cmdline --interactive"
