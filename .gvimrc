set t_Co=256
colorscheme monokai "desert

set lines=60
set columns=130

augroup numberwidth
    autocmd!
    autocmd BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 2
augroup END



