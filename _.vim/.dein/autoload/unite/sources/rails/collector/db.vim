"
" gather candidates
"
function! unite#sources#rails#collector#db#candidates(source)
  let target = a:source.source__rails_root . '/db'
  return unite#sources#rails#helper#gather_candidates_file(target)
endfunction
