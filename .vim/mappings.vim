"*******************************************************************************
"
" mappings
"
"*******************************************************************************

" Leader: global and plugin mappings
" LocalLeader: mappings local to current buffer (<buffer> mappings)

let mapleader = ','
let maplocalleader = '\'

" it should allow to use option (alt) in most mappings
" but it breaks mappings for moving tabs (:tabmove)
"set macmeta

"===============================================================================
"
" all modes
"
"===============================================================================

"-------------------------------------------------------------------------------
" <C-c> and <C-Backspace>
"-------------------------------------------------------------------------------

" turn off highlighting and clear messages
" <C-c> in normal mode aborts any pending command
nnoremap <silent> <C-c> <C-c>:nohlsearch<Bar>:echo<CR>
nmap <silent> <C-Backspace> <C-c>

" map to <Esc> for vertical editing to work
inoremap <silent> <C-c> <Esc>
imap <silent> <C-Backspace> <C-c>

xnoremap <C-Backspace> <Esc>
" <C-Backspace> in command mode acts like <Esc> -
" it interrupts current function execution but
" doesn't exit command mode immediately like <C-c>
cnoremap <C-Backspace> <C-c>

"===============================================================================
"
" normal mode
"
"===============================================================================

"-------------------------------------------------------------------------------
" copy current file name to clipboard
" (relative to PWD or absolute path if file is not in current dir)
"-------------------------------------------------------------------------------

" :help expand
nnoremap <silent> <Leader>yf :let @*=expand('%')<CR>

"-------------------------------------------------------------------------------
" edit without leaving normal mode
"-------------------------------------------------------------------------------

" delete trailing whitespaces
nnoremap <silent> <Leader>dt :%s/\s\+$//<CR>:w<CR>:nohlsearch<CR>
" insert newline after current line
nmap <silent> <CR> o<Esc>
" insert newline before current line
nmap <silent> <S-CR> O<Esc>
" insert space
nmap <silent> <Space> i<Space><Esc>l

"-------------------------------------------------------------------------------
" fold
"-------------------------------------------------------------------------------

nnoremap <Backspace> za

"-------------------------------------------------------------------------------
" open popular files
"-------------------------------------------------------------------------------

nnoremap <Leader>ov :tabnew<CR>:edit $MYVIMRC<CR>
nnoremap <Leader>oz :tabnew<CR>:edit ~/.zshenv<CR>

"-------------------------------------------------------------------------------
" fullscreen
"-------------------------------------------------------------------------------

" doesn't work this way - change toggle fullscreen mode key in
" System Preferences -> Keyboard -> Shortcuts -> App Shortcuts
"macmenu Window.Toggle\ Full\ Screen\ Mode key=<nop>

"-------------------------------------------------------------------------------
" navigation
"-------------------------------------------------------------------------------

" move vertically by visual line - not real one
" (comment out so far - I don't use line wrapping)
"nnoremap j gj
"nnoremap k gk

nnoremap <C-j> 10j
nnoremap <C-k> 10k

" g_ (unlike $) doesn't select newline character in visual mode
nnoremap H ^
nnoremap L g_

" http://vim.1045645.n5.nabble.com/
"   lt-SID-gt-or-s-General-questions-about-functions-td4297515.html#a4298658
"
" use <SID> prefix to call functions defined with 's:' in mapping definition
nnoremap <C-Tab> :call <SID>GoToLastActiveTab()<CR>

"------- buffer ----------------------------------------------------------------

" same as <C-6>
nnoremap <silent> <C-s> :b#<CR>
nnoremap <silent> <S-Backspace> :bd<CR>

"nnoremap <silent> <C-p> :bprevious<CR>
"nnoremap <silent> <C-n> :bnext<CR>

"------- mark history ----------------------------------------------------------

" this mapping must come before remapping <Tab>
nnoremap <C-g> <C-i>

"------- tab -------------------------------------------------------------------

" same as using gT and gt
nnoremap <silent> <C-h> :tabprevious<CR>
nnoremap <silent> <C-l> :tabnext<CR>

nmap <silent> ˙ :tabmove -1<CR>
nmap <silent> ¬ :tabmove +1<CR>

"------- window ----------------------------------------------------------------

" http://vim.wikia.com/wiki/Open_file_under_cursor
"set isfname-=.
"nnoremap <C-w>F :vertical wincmd f<CR>
nmap <C-w>F <C-w>f<C-w>L

nmap <silent> <S-Up> :resize +5<CR>
nmap <silent> <S-Down> :resize -5<CR>
nmap <silent> <S-Left> :vertical resize -5<CR>
nmap <silent> <S-Right> :vertical resize +5<CR>

"-------------------------------------------------------------------------------
" reload file using different encoding
"
" :help user-commands
" call function: command! MyFunction call MyFunction()
"-------------------------------------------------------------------------------

command! EncodeInWindows1251 :edit ++encoding=cp1251<CR>
command! EncodeInUTF8 :edit ++encoding=utf-8<CR>

"-------------------------------------------------------------------------------
" save
"-------------------------------------------------------------------------------

nnoremap <silent> <Tab> :w<CR>

"-------------------------------------------------------------------------------
" sourcing configuration files
"-------------------------------------------------------------------------------

nnoremap <Leader>.v :source $MYVIMRC<CR>

"-------------------------------------------------------------------------------
" suppress unwanted keys (set to noop)
"-------------------------------------------------------------------------------

nnoremap Q <nop>
nnoremap K <nop>
nnoremap <F1> <nop>

"-------------------------------------------------------------------------------
" yanking
"-------------------------------------------------------------------------------

nnoremap Y y$

"-------------------------------------------------------------------------------
" useful maps
"-------------------------------------------------------------------------------

" TODO: function to toggle focusing in rspec

" http://superuser.com/a/382582
" http://vim.wikia.com/wiki/Selecting_your_pasted_text
"
" highlight last inserted or pasted text (works till save)
nnoremap gp `[v`]

"===============================================================================
"
" insert mode
"
"===============================================================================

inoremap jj <Esc>

"-------------------------------------------------------------------------------
" editing
"-------------------------------------------------------------------------------

inoremap <C-d> <Delete>

"-------------------------------------------------------------------------------
" generation of complementary characters
"-------------------------------------------------------------------------------

inoremap {{ {<Space><Space>}<Esc>hi
inoremap }} {}<Esc>i
inoremap >> <><Esc>i
"inoremap )) ()<Esc>i
"inoremap ]] []<Esc>i

"-------------------------------------------------------------------------------
" navigation
"-------------------------------------------------------------------------------

inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-a> <C-o>I
inoremap <C-e> <C-o>A

"------- tab --------------------------------------------------------------------

inoremap <silent> <A-S-Left> <C-o>:tabmove -1<CR>
inoremap <silent> <A-S-Right> <C-o>:tabmove +1<CR>
inoremap <silent> <A-S-Down> <C-o>:tabmove 0<CR>
inoremap <silent> <A-S-Up> <C-o>:tabmove<CR>

"===============================================================================
"
" visual mode
"
" http://stackoverflow.com/a/3787802/3632318
"
" vmap and vnoremap work in visual and select modes,
" use xmap and xnoremap to have mapping in visual mode only
"
"===============================================================================

"-------------------------------------------------------------------------------
" editing
"
" http://stackoverflow.com/a/10723838/3632318
"-------------------------------------------------------------------------------

"xnoremap p "_dP

"-------------------------------------------------------------------------------
" navigation
"-------------------------------------------------------------------------------

xnoremap <C-j> 10j
xnoremap <C-k> 10k

xnoremap H ^
xnoremap L g_

"-------------------------------------------------------------------------------
" indenting
"
" http://stackoverflow.com/a/444461
" http://stackoverflow.com/a/1413854
"
" alternatively use:
" . - repeat indenting
" u - undo indenting
" gv - restore last visual block
"-------------------------------------------------------------------------------

"xnoremap < <gv
"xnoremap > >gv

"-------------------------------------------------------------------------------
" searching
"-------------------------------------------------------------------------------

xnoremap * y/<C-r>"<CR>

"===============================================================================
"
" command mode
"
" https://stackoverflow.com/a/7186983/3632318
" :help cmdline-editing
"
"===============================================================================

cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

"===============================================================================
"
" functions for mappings
"
"===============================================================================

" finds alternate file using uptech/oss/alt (installed with brew) -
" currently not used because it's not fast enough
"
" define command globally (without s: prefix) so that it can be used
" in after/ftplugin/elixir.vim - I cannot define it in ftplugin file
" because vim complains that it's redefined when opening elixir file
"function! AltCommand(path, vim_command)
"  let l:alternate = system('alt ' . a:path)

"  if empty(l:alternate)
"    echohl WarningMsg
"    echo 'No alternate file for ' . a:path . ' exists!'
"    echohl None
"  else
"    exec a:vim_command . " " . l:alternate
"  endif
"endfunction

function! s:GoToLastActiveTab()
  " return if g:lasttabnr variable is not set - it means current
  " tab is the only one and other tabs have never been opened
  if !exists('g:lasttabnr') | return | endif

  " return if there is only one tab left
  " (all other tabs have been closed)
  if tabpagenr('$') == 1 | return | endif

  exec 'tabnext ' . g:lasttabnr
endfunction
