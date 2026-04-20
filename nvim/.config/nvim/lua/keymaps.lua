local keymap = vim.keymap.set
local s = { silent = true }

vim.g.mapleader = " "

keymap("n", "<space>", "<Nop>")
keymap("n", "<Leader>_", "<cmd>vsplit<CR>", s) -- Split the window vertically
keymap("n", "<Leader>-", "<cmd>split<CR>", s) -- Split the window horizontally
keymap("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", s) -- Format the current buffer using LSP
keymap("v", "<Leader>p", '"_dP') -- Paste without overwriting the default register
keymap("x", "y", [["+y]], s) -- Yank to the system clipboard in visual mode
keymap("v", "<Leader>p", '"_dP') -- Paste without overwriting the default register
keymap("n", "<leader>ps", '<cmd>lua vim.pack.update()<CR>')
keymap("n", "<Leader>ex", "<cmd>Ex %:p:h<CR>")

local opts = { noremap = true, silent = true }

keymap("n", "gd", vim.lsp.buf.definition, vim.tbl_extend('force', opts, {desc = "Go To Definition"})) -- Go to definition
keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, {  desc = "Code Action" }))
keymap("n", "<leader>lg", "<cmd>LazyGit<CR>", vim.tbl_extend("force", opts, { desc = "Open LazyGit" }))
keymap("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend('force', opts, {  desc = "Rename Symbol"}))


keymap('n', '<leader>m', require('miniharp').toggle_file, { desc = 'miniharp: toggle file mark' })
keymap('n', '<C-n>',     require('miniharp').next,        { desc = 'miniharp: next file mark' })
keymap('n', '<C-p>',     require('miniharp').prev,        { desc = 'miniharp: prev file mark' })
keymap('n', '<leader>l', require('miniharp').show_list,   { desc = 'miniharp: list marks' })

keymap("n", "<leader>ff", '<cmd>FzfLua files<CR>')
keymap("n", "<leader>fg", '<cmd>FzfLua live_grep<CR>')

keymap({ "n", "v" }, "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = false })
end, { desc = "Format with Prettier (conform)" })
