set autowriteall
set clipboard=unnamedplus
set expandtab shiftwidth=2
set ignorecase smartcase nohlsearch
set inccommand=nosplit
set mouse=n

nn <esc> :q<cr>
nn L <C-^>

nn <space>e :e $MYVIMRC<cr>
nn <expr> <space>f ':sp ~/.config/nvim/after/ftplugin/' . &ft . '.vim<cr>'
nn <space>s :w<cr>

map f <Plug>Sneak_f
map F <Plug>Sneak_F

" status
set statusline=%f%m%r%=%c,%l/%-6L%{strftime(\"%a\ %d\ %l:%M\")}
call timer_start(10000, {-> execute('let &ro = &ro')}, {'repeat': -1})

" restore cursor
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
