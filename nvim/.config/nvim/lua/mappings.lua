require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("i", "<leader>a", "<esc>A")
map("i", "<leader>o", "<esc>o")
map("n", "=", function()
  require('conform').format({ lsp_fallback = true })
end)
map("n", "zz", ":q!<cr>")
map("n", "<leader>w", ":w<cr>")
map("n", "<leader>q", ":CloseBuffer<cr>")
map("n", "<leader>w-", "<C-W>-")
map("n", "<leader>w[", "<C-W>=")
map("n", "<leader>w+", "<C-W>+")
map("n", "<leader>w]", "<C-W>_")
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")
map("n", "<leader>v", ":vsplit<cr>")
map("n", "<space>", ":nohlsearch<cr>")
map("n", "`", "@a")
map("n", "<leader>e", ":NnnPicker %:p:h<CR>")
map("n", "gn", ":bnext<cr>")
map("n", "gp", ":bprevious<cr>")
map("n", "<leader>c", ":lua require('Comment.api').toggle.linewise.current()<cr>")
map("n", "<leader>x", ":Trouble diagnostics toggle focus=false filter.buf=0<cr>")
map("n", "ga", ":Lspsaga code_action<CR>")
map("n", "gk", ":Lspsaga hover_doc<CR>")
map("n", "gd", ":Lspsaga peek_definition<CR>")
map("n", "<leader>r", ":Lspsaga rename<CR>")
map("n", "<leader>f", ":Telescope find_files<CR>")

map("v", "<leader>c", ":lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<cr>")
