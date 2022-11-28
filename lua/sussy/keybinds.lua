local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

-- terminal and file explorer
vim.keymap.set('n', '<leader>t', '<CMD>ToggleTerm<CR>')
vim.keymap.set('n', '<leader>.', '<CMD>NvimTreeToggle<CR>')

-- caps to escape
vim.keymap.set('i', 'kj', '<esc>')

-- windows and panes
vim.keymap.set('n', '<leader>wh', '<C-w>h')
vim.keymap.set('n', '<leader>wl', '<C-w>l')
vim.keymap.set('n', '<leader>wj', '<C-w>j')
vim.keymap.set('n', '<leader>wk', '<C-w>k')
vim.keymap.set('n', '<leader>wc', '<CMD>bd<CR>')

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

M.nmap = bind("n", {noremap = false})
M.nnoremap = bind("n") M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")
local map = vim.api.nvim_set_keymap

map('n', '<S-Tab>',   '<CMD>BufferLineCyclePrev<CR>',  { silent = true })
map('n', '<Tab>',     '<CMD>BufferLineCycleNext<CR>',  { silent = true })

for i = 1,9 do
  map('n', ('<F%s>'):format(i),      ('<Plug>(cokeline-focus-%s)'):format(i),  { silent = true })
  map('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i), { silent = true })
end

return M
