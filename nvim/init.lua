local options = {
  clipboard = 'unnamed',
  expandtab = true,
  inccommand = 'nosplit',
  shiftwidth = 2,
}

local gopts = {
  loaded_netrw = 1,
  loaded_netrwPlugin = 1,
}

-- nvim_set_keymap
-- empty string for map
local keymap = {
  [''] = {
    f = '<Plug>Sneak_s',
    F = '<Plug>Sneak_S',
  },
  n = {
    ['<Esc>'] = ':x<CR>'
  }
}

local autocommands = {
  'BufRead *'
  ..[[ if &ft !~# 'commit' ]]
  ..[[ | exe 'normal! g`"' ]]
  ..[[ | endif ]],
  [[ CmdlineEnter /,\? :set hlsearch ]],
  [[ CmdlineLeave /,\? :set nohlsearch ]],
}

-- https://github.com/neovim/neovim/issues/11179
-- nvim_set_option does not currently behave like :set
for cmd, v in pairs(options) do
  cmd = 'set ' .. cmd
  if (v ~= true) then
    cmd = cmd .. '=' .. v
  end
  vim.api.nvim_command(cmd)
end

for k, v in pairs(gopts) do
  vim.api.nvim_set_var(k, v)
end

for mode, maps in pairs(keymap) do
  for k, v in pairs(maps) do
    vim.api.nvim_set_keymap(mode, k, v, {})
  end
end

for _, cmd in pairs(autocommands) do
  vim.api.nvim_command('autocmd ' .. cmd)
end
