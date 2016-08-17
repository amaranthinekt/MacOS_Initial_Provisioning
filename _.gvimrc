colorscheme molokai "desert

set lines=60
set columns=100

augroup numberwidth
    autocmd!
    autocmd BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 2
augroup END



