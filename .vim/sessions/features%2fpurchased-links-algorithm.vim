" ~/.dotfiles/.vim/sessions/features%2fpurchased-links-algorithm.vim:
" Vim session script.
" Created by session.vim 2.4.9 on 30 May 2014 at 15:28:00.
" Open this file in Vim and run :source % to restore your session.

set guioptions=egm
silent! set guifont=MonacoB2:h13
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'light'
	set background=light
endif
if !exists('g:colors_name') || g:colors_name != 'summerfruit' | colorscheme summerfruit | endif
call setqflist([])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dev/uptimus
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +13 app/models/site.rb
badd +1 app/models/query.rb
badd +21 app/models/page.rb
badd +14 db/seeds/development/queries.seeds.rb
badd +1 lib/database_seed.rb
badd +7 db/seeds/development/pages.seeds.rb
badd +6 db/seeds/development/sites.seeds.rb
badd +31 app/decorators/site_decorator.rb
badd +1 app/admin/closed_months.rb
badd +13 spec/models/page_spec.rb
badd +21 spec/models/query_spec.rb
badd +80 spec/models/site_spec.rb
badd +23 app/forms/site_form.rb
badd +1 app/services/queries_builder.rb
badd +226 db/schema.rb
badd +20 ~/dev/uptimus/app/workers/query_requisite_links.rb
badd +0 app/controllers/sites_controller.rb
badd +61 spec/controllers/sites_controller_spec.rb
badd +6 spec/factories/sites.rb
badd +4 spec/workers/query_requisite_links_spec.rb
badd +1 spec/factories/statistics_query_positions.rb
badd +1 spec/factories/queries.rb
badd +4 spec/factories/pages.rb
badd +1 app/services/api/technology/main_mirror.rb
badd +4 app/services/api/technology/links.rb
badd +1 app/services/api/technology/sitemap.rb
badd +1 app/services/api/technology/meta_tags_api.rb
badd +1 app/services/api/technology/meta_robots.rb
badd +0 app/services/api/technology/api_base.rb
badd +0 app/services/api/technology/encoding.rb
badd +14 app/services/api/technology/page_address.rb
badd +1 app/services/financial_period.rb
badd +1 app/services/payments_service.rb
badd +10 app/services/query_links_quota.rb
badd +1 app/services/client_bank_parser.rb
badd +1 app/services/balance.rb
badd +0 app/services/api_test.rb
badd +0 spec/services/queries_builder_spec.rb
badd +14 spec/services/query_links_quota_spec.rb
badd +0 spec/factories/regions.rb
badd +1 spec/controllers/admin_log_in_controller_spec.rb
badd +1 spec/controllers/admin_panels_controller_spec.rb
badd +1 spec/controllers/advices_controller_spec.rb
badd +1 spec/controllers/bank_payments_controller_spec.rb
badd +1 spec/controllers/bootstrap_controller_spec.rb
badd +1 spec/controllers/credentials_controller_spec.rb
badd +1 spec/controllers/dashboard_controller_spec.rb
badd +1 spec/controllers/regions_controller_spec.rb
badd +1 spec/models/closed_month_spec.rb
badd +1 spec/models/closing_document_spec.rb
badd +1 spec/models/commission_fee_spec.rb
badd +1 spec/models/competitor_spec.rb
badd +1 spec/models/contact_spec.rb
badd +1 spec/models/correction_spec.rb
badd +1 spec/query_objects/date_conditions_spec.rb
badd +1 spec/query_objects/regions_query_spec.rb
badd +1 spec/query_objects/summary_budget_spec.rb
badd +1 spec/query_objects/unpaid_projects_spec.rb
badd +0 spec/query_objects/user_service_pays_spec.rb
silent! argdel *
edit app/models/site.rb
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 119 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 119 + 119) / 239)
" argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 95 - ((18 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
95
normal! 08|
wincmd w
" argglobal
edit spec/models/site_spec.rb
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 206 - ((44 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
206
normal! 025|
wincmd w
exe 'vert 1resize ' . ((&columns * 119 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 119 + 119) / 239)
tabedit app/models/query.rb
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 119 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 119 + 119) / 239)
" argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 26 - ((25 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
26
normal! 05|
wincmd w
" argglobal
edit spec/models/query_spec.rb
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 90 - ((33 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
90
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 119 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 119 + 119) / 239)
tabedit app/services/queries_builder.rb
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 119 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 119 + 119) / 239)
" argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
" argglobal
edit spec/services/queries_builder_spec.rb
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 9 - ((8 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
9
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 119 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 119 + 119) / 239)
tabedit app/services/query_links_quota.rb
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 119 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 119 + 119) / 239)
" argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 7 - ((6 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
7
normal! 018|
wincmd w
" argglobal
edit spec/services/query_links_quota_spec.rb
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 14 - ((13 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
14
normal! 011|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 119 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 119 + 119) / 239)
tabnext 4
if exists('s:wipebuf')
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOI
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

tabnext 4
2wincmd w
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf))
if !getbufvar(s:wipebuf, '&modified')
  let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:wipebuf
  endif
endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
