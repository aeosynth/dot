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
let g:sneak#s_next=1

map f <Plug>Sneak_f
map F <Plug>Sneak_F
" Sneak is invoked with operators via z (because ... surround.vim).
map s <Plug>Sneak_s
map S <Plug>Sneak_S

nn <esc> :x<cr>
nn ; :
nn <C-k> <C-w>w
nn <C-l> <C-^>
nn <space>ts :sp +term\ nu<cr>
nn <space>tt :term nu<cr>
nn <space>a zA
nn <space>b :ls<cr>:b 
nn <space>eb :e ~/notes/book/current.md<cr>
nn <space>ee :e $MYVIMRC<cr>
nn <space>ei :e ~/notes/ideas.md<cr>
nn <space>et :e ~/notes/todo.md<cr>
nn <space>sb :e ~/notes/book/current.md<cr>
nn <space>se :sp $MYVIMRC<cr>
nn <expr> <space>sf ':sp ~/.config/nvim/after/ftplugin/' . &ft . '.vim<cr>'
nn <space>si :sp ~/notes/ideas.md<cr>
nn <space>st :sp ~/notes/todo.md<cr>

" update status line
call timer_stopall()
call timer_start(10000, {-> execute('let &ro = &ro')}, {'repeat': -1})

augroup startup
  autocmd!
  " restore cursor
  au BufRead *
  \ if &ft !~# 'commit'
  \ | exe 'normal! g`"'
  \ | endif
  " MANPAGER = nvim
  au BufRead /tmp/man.* set ft=man
  " center
  au BufWinEnter * exe 'normal! zz'
  " active/inactive statusline
  au WinEnter * setlocal statusline=%!StatusLine(1)
  au WinLeave * setlocal statusline=%!StatusLine(0)
  " toggle hlsearch
  au CmdlineEnter /,\? set hlsearch
  au CmdlineLeave /,\? set nohlsearch
  " terminal
  au TermOpen * startinsert
augroup END

function! StatusLine(active)
  return '%f%m%r%='.
    \(a:active ? '%c,%l/%-6L%{strftime("%a\ %d\ %l:%M")}' : '')
endfunction
