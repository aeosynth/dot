function! StatusLine(active)
  return '%f%m%r%='.
    \(a:active ? '%c,%l/%-6L%{strftime("%a\ %d\ %l:%M")}' : '')
endfunction

set clipboard=unnamedplus
set expandtab
set inccommand=nosplit
set mouse=n
set scrolloff=2
set shiftwidth=2
set statusline=%!StatusLine(1)

" disable netrw (use a different tool)
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1
let g:markdown_folding=1

map f <Plug>Sneak_f
map F <Plug>Sneak_F
" Sneak is invoked with operators via z (because ... surround.vim).
map s <Plug>Sneak_s
map S <Plug>Sneak_S

nn <c-k> <C-^>
nn <esc> :x<cr>
nn <space>; :sp +startinsert \| term nu<cr>
nn <space>a zA
nn <space>ee :sp $MYVIMRC<cr>
nn <expr> <space>ef ':sp ~/.config/nvim/after/ftplugin/' . &ft . '.vim<cr>'
nn <space>ei :sp ~/notes/ideas.md<cr>
nn <space>et :sp ~/notes/todo.md<cr>

" update status line
call timer_start(10000, {-> execute('let &ro = &ro')}, {'repeat': -1})

" restore cursor
au BufRead *
\ if &ft !~# 'commit'
\ | exe 'normal! g`"'
\ | endif
" MANPAGER = nvim
au BufRead /tmp/man.* set ft=man
" open fold, center (hide error when there are no folds)
au BufWinEnter * silent! exe 'normal! zOzz'
" active/inactive statusline
au WinEnter * setlocal statusline=%!StatusLine(1)
au WinLeave * setlocal statusline=%!StatusLine(0)
" toggle hlsearch
au CmdlineEnter /,\? set hlsearch
au CmdlineLeave /,\? set nohlsearch
" terminal
au TermClose * call feedkeys('q')
