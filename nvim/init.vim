set clipboard=unnamedplus
set expandtab
set inccommand=nosplit
set mouse=n
set shiftwidth=2
set statusline=%f%m%r%=%c,%l/%-5L%{strftime('%a\ %l:%M\ %p')}

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
nn <space>ea :sp ~/.config/alacritty/alacritty.yml<cr>
nn <expr> <space>ef ':sp ~/.config/nvim/after/ftplugin/' .. &ft .. '.vim<cr>'
nn <space>ee :sp $MYVIMRC<cr>
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
" toggle hlsearch
au CmdlineEnter /,\? set hlsearch
au CmdlineLeave /,\? set nohlsearch
" terminal
au TermClose * call feedkeys('q')
