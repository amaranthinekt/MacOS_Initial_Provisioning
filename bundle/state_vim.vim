let [plugins, ftplugin] = dein#load_cache_raw(['/Users/amaranthine/.vimrc'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/amaranthine/.vim/bundle'
let g:dein#_runtime_path = '/Users/amaranthine/.vim/bundle/.dein'
let &runtimepath = '/Users/amaranthine/.vim/bundle/.dein,/Users/amaranthine/.vim,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim74,/usr/local/share/vim/vimfiles/after,/Users/amaranthine/.vim/after,/Users/amaranthine/.vim/bundle/repos/github.com/Shougo/dein.vim,/Users/amaranthine/.vim/bundle/.dein/after'
filetype off
