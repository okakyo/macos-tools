
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<leader><leader>', ':<C-u>cd %:h<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>w', ':<C-u>w<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>q', ':<C-u>bd<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':<C-u>bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-h>', ':<C-u>bprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap = true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap = true})
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {silent=true})
vim.api.nvim_set_keymap('n', '<ESC><ESC>', ':nohlsearch<CR>', {silent=true})
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', {silent=true})
vim.api.nvim_set_keymap('t', '<C-W>j', '<CMD>wincmd j<CR>', {silent=true})
vim.api.nvim_set_keymap('t', '<C-W>k', '<CMD>wincmd k<CR>', {silent=true})
vim.api.nvim_set_keymap('t', '<C-W>h', '<CMD>wincmd h<CR>', {silent=true})
vim.api.nvim_set_keymap('t', '<C-W>l', '<CMD>wincmd l<CR>', {silent=true})

-- 'nvim-telescope/telescope.nvim' ----------------------------------------------------------

-- 今回追加分

vim.keymap.set('n', 'fb', '<cmd>lua require("telescope.builtin").file_browser()<cr>',{noremap = true})
vim.keymap.set('n', 'ff', '<cmd>lua require("telescope.builtin").find_files()<cr>',{noremap = true})
vim.keymap.set('n', 'fg', '<cmd>lua require("telescope.builtin").find_grep()<cr>',{noremap = true})
vim.keymap.set('n', 'fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>',{noremap = true})

-- 'tpope/vim-fugitive' --------------------------------------------------------
vim.api.nvim_set_keymap('n', '<leader>GG', ':<C-u>Git<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>GC', ':<C-u>Git commit<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>GP', ':<C-u>Git push<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>GL', ':<C-u>Git log --oneline<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>GD', ':<C-u>vert Gdiffsplit !~1', {noremap = true})

-- lambdalisue/fern.vim ---------------------------------------------------------
vim.api.nvim_set_keymap('n', '<C-n>', ':Fern . -reveal=% -drawer -toggle -width=40<CR>',{noremap = true})

