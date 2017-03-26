"===============================================================================
"                                                                              =
" autocommands                                                                 =
"                                                                              =
" exclamation mark means to remove all autocommands associated with event,     =
" pattern and command - the point here is that by default autocommands are     =
" are accumulated every time .vimrc is sourced.                                =
"                                                                              =
"===============================================================================

augroup backup
  autocmd!
  autocmd BufWritePre * call s:SetBackupDir()
augroup END

augroup filetypes
  autocmd!
  autocmd BufRead,BufNewFile *.arb,*.jb setlocal filetype=ruby
  " using rspec filetype for specs doesn't change highlighting
  " at all but prevents rubocop checker from running on them
  "autocmd BufRead,BufNewFile *_spec.rb set filetype=rspec
augroup END

augroup filetype_mappings
  autocmd!
  autocmd FileType markdown nmap <buffer> <LocalLeader>p :!publish<CR>
augroup END

let s:prevtabnr = tabpagenr()
let s:prevtabcount = tabpagenr('$')
augroup tabs
  autocmd!
  " go to previous tab after closing tab
  autocmd TabEnter * call s:GoToPrevTab()
  " to be able to switch to last active tab - see mappings
  autocmd TabLeave * let g:lasttabnr = tabpagenr()
augroup END

augroup vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC | call lightline#enable()
augroup END

" `my_` prefix is used when there already exists autocommand group
" with the same name in some vim plugin

augroup my_lightline
  autocmd!
  " to remove syntastic message after save if there are no more errors
  autocmd BufWritePost *.rb,*.arb,*.jb call lightline#update()
augroup END

" used to disable <CR> in quickfix window - now it's
" not necessary because QFEnter mapping already does it
"augroup quickfix
"  autocmd!
"  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
"  " http://stackoverflow.com/a/13813231
"  autocmd QuickFixCmdPre * let g:winview = winsaveview()
"  autocmd QuickFixCmdPost * call winrestview(g:winview)
"augroup END

"===============================================================================
"                                                                              =
" functions for autocommands                                                   =
"                                                                              =
"===============================================================================

function! s:SetBackupDir()
  let l:backupdir = $HOME . '/.vim/backup' . expand('%:p:h')
  if !isdirectory(l:backupdir)
    call mkdir(l:backupdir, 'p', 0700)
  endif

  let &backupdir = l:backupdir
  let &backupext = strftime('~(%Y-%m-%d %H:%M:%S)')
endfunction

" http://stackoverflow.com/questions/14079149
function! s:GoToPrevTab()
  if tabpagenr('$') < s:prevtabcount && tabpagenr() > 1 && tabpagenr() == s:prevtabnr
    tabprevious
  endif

  let s:prevtabnr = tabpagenr()
  let s:prevtabcount = tabpagenr('$')
endfunction

" returns 1 (true) if buffer hidden or 0 (false) otherwise
" http://stackoverflow.com/a/8459043
"function! BufHidden(buf)
"  let active_buffers = []
"  let tabs = range(1, tabpagenr('$'))

"  call map(tabs, 'extend(active_buffers, tabpagebuflist(v:val))')
"  return (bufexists(a:buf) && index(active_buffers, a:buf) == -1)
"endfunction

" a:000: http://learnvimscriptthehardway.stevelosh.com/chapters/24.html
" sbuffer: `buffer` function doesn't respect `switchbuf` option
"function! GotoOrOpenTab(...)
"  for file in a:000
"    " if buffer exists and not hidden
"    if bufexists(file) && !BufHidden(bufnr(file))
"      exec 'sbuffer ' . file
"    else
"      exec 'tabedit ' . file
"    endif
"  endfor
"endfunction
