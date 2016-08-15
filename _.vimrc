set nocompatible

set notitle
let &titleold=getcwd()

"#####表示設定#####
set number "行番号を表示する
"set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=4 "インデントをスペース4つ分に設定
set smartindent "オートインデント
set clipboard=unnamed
set listchars=eol:$,tab:>\ 

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
nnoremap <ESC><ESC> :nohlsearch<CR>

"####ステータスライン#####
" set laststatus=2
" set statusline=%<%f\ %m%r%h%w
" set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
" set statusline+=%=%l/%L,%c%V%8P

augroup numberwidth
    autocmd!
    autocmd BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 2
augroup END


augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" dein
" Vim起動完了時にインストール
augroup PluginInstall
  autocmd!
  autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

" 各プラグインをインストールするディレクトリ
let s:plugin_dir = expand('~/.vim/bundle/')
" dein.vimをインストールするディレクトリをランタイムパスへ追加
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_dir

" dein.vimがまだ入ってなければ 最初に`git clone`
if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
  silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif

if dein#load_state(s:plugin_dir)
  call dein#begin(s:plugin_dir)

  " ここからインストールするプラグインを書いていく
  call dein#add('Shougo/dein.vim')
  call dein#add('mrtazz/simplenote.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('mattn/emmet-vim')
  call dein#add('tomasr/molokai')

  " インストール後ビルドする場合
  "call dein#add('Shougo/vimproc.vim', {
  "     \ 'build': {
  "     \     'mac': 'make -f make_mac.mak',
  "     \     'linux': 'make',
  "     \     'unix': 'gmake',
  "     \    },
  "     \ })

  " 条件によって使ったり使わなかったり制御する場合
  call dein#add('Shougo/neocomplete.vim', {'if' : has('lua') })

  " 依存関係がある場合
  call dein#add('Shougo/unite.vim')
  call dein#add('ujihisa/unite-colorscheme', {'depends' : 'Shougo/unite.vim'})
  "call dein#add('unite-rails', {'depends': 'Shougo/unite.vim'})
  
  " 手動でcall dein#source('プラグイン名')して使い始める場合
  "call dein#add('Shougo/vimfiler', {'lazy' : 1})

  " 指定のファイルタイプ使う場合
  call dein#add('tpope/vim-rails', {'on_ft' : 'ruby'})
  call dein#add('ngmy/vim-rubocop', {'on_ft' : 'ruby'})
  "call dein#add('thinca/vim-ref', {'on_ft' : 'ruby'})
  "call dein#add('thinca/vim-ref-ri', {'on_ft' : 'ruby'})
  call dein#add('tpope/vim-endwise', {'on_ft': 'ruby'})
  call dein#add('vim-scripts/ruby-matchit', {'on_ft': 'ruby'})
  
  call dein#add('pangloss/vim-javascript', {'on_ft': 'javascript'})
  call dein#add('mxw/vim-jsx', {'on_ft': 'javascript'})


  " dein.vimで管理して更新だけするリポジトリ（NeoBundleFetchとおなじ）
  "call dein#add('jszakmeister/markdown2ctags', {'rtp': ''})

  " サブディレクトリを指定してdein#add()する場合
  " frozenオプションは自動で更新しない
  " 自分で開発するプラグインの管理に便利
  "call dein#local('~/src/github.com/violetyk',
  "     \ {
  "     \   'frozen' : 1,
  "     \   'depends' : [
  "     \     'kana/vim-gf-user',
  "     \     'Shougo/neosnippet.vim',
  "     \     'vim-jp/vital.vim'
  "     \   ]
  "     \ },
  "     \ [
  "     \   '*.vim',
  "     \   'neosnippet-*',
  "     \   'neocomplete-*',
  "     \   'scratch-utility'
  "     \ ])
  call dein#end()
  call dein#save_state()
endif

autocmd FileType html imap <buffer><expr><tab>
    \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
    \ "\<tab>"

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" javascriptとJSXの2つのファイルタイプを指定する
au BufRead,BufNewFile *.jsx set filetype=javascript.jsx

filetype plugin indent on
