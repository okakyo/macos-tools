local opt = vim.opt

opt.backup = false
opt.swapfile = false
opt.autoread = true
opt.hidden =true
opt.showcmd = true

opt.number = true
opt.relativenumber = true

opt.ruler = true
opt.title = true
opt.cursorline = true
opt.virtualedit ='onemore'
opt.smartindent = true
opt.showmatch = true
opt.laststatus=2
opt.backspace='2'
opt.wildmode='list:longest'
opt.expandtab = true

opt.mouse='a'

opt.clipboard='unnamed'
opt.whichwrap='b,s,h,l,<,>,[,],~'

opt.list = true
opt.listchars='tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%'

opt.shiftwidth=2
opt.softtabstop=2
opt.tabstop=2

opt.ignorecase = true
opt.smartcase  = true
opt.incsearch  =true
opt.wrapscan  =true
opt.hlsearch  =true

vim.cmd 'autocmd TermOpen * startinsert'
vim.cmd [[
if executable('fcitx5')
  let g:fcitx_state = 1
  augroup fcitx_savestate
    autocmd!
    autocmd InsertLeave * let g:fcitx_state = str2nr(system('fcitx5-remote'))
    autocmd InsertLeave * call system('fcitx5-remote -c')
    autocmd InsertEnter * call system(g:fcitx_state == 1 ? 'fcitx5-remote -c': 'fcitx5-remote -o')
  augroup END
endif
]]

