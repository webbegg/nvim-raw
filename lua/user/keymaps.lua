vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymapOptions = { silent = true }

vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', keymapOptions)
vim.keymap.set('n', '<leader>q', ':bufdo bdelete<CR>', keymapOptions)
vim.keymap.set('n', '<S-w>', 'b', keymapOptions)
vim.keymap.set('n', '<S-u>', '<C-r>', keymapOptions)
vim.keymap.set('i', 'jj', '<Esc>', keymapOptions)
vim.keymap.set('n', '<C-s>', ':w<CR>', keymapOptions)
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', keymapOptions)
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>', keymapOptions)
vim.keymap.set('n', '<C-q>', ':bd<CR>', keymapOptions)
vim.keymap.set('n', '<C-w><C-p>', ':e #<CR>', keymapOptions)

-- Allow gf to open non-existent files
vim.keymap.set('', 'gf', ':edit <cfile><CR>')

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', 'myy`y')
vim.keymap.set('v', 'Y', 'myY`y')

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Paste replace visual selection without copying it
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of a trailing ; or , from insert mode
vim.keymap.set('i', ';;', '<Esc>A;<Esc>')
vim.keymap.set('i', ',,', '<Esc>A,<Esc>')

-- Open the current file in the default program (on Mac this should just be just `open`)
vim.keymap.set('n', '<leader>x', ':!xdg-open %<cr><cr>')

-- Disable annoying command line thing
vim.keymap.set('n', 'q:', ':q<CR>')

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

-- Move text up and down
-- vim.keymap.set('n', '<A-Down>', '<Esc>:move .+1<CR>==gi')
-- vim.keymap.set('n', '<A-Up>', '<Esc>:move .-2<CR>==gi')
-- vim.keymap.set('i', '<A-Down>', '<Esc>:move .+1<CR>==gi')
-- vim.keymap.set('i', '<A-Up>', '<Esc>:move .-2<CR>==gi')
-- vim.keymap.set('x', '<A-Down>', ":move '>+1<CR>gv-gv")
-- vim.keymap.set('x', '<A-Up>', ":move '<-2<CR>gv-gv")
-- vim.keymap.set('v', '<A-Down>', ":move '>+1<CR>gv-gv")
-- vim.keymap.set('v', '<A-Up>', ":move '<-2<CR>gv-gv")
