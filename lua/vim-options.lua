vim.cmd("set number")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set({ "n", "v" }, "Y", '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>s", [["hy:%s/\V<C-r>h/<C-r>h/gc<Left><Left><Left>]])

-- let g:wiki_root = '~/wiki'
vim.g.wiki_root = '~/wiki'

