local keymap = vim.keymap

function setKeymap(mode, key, command, desc)
  keymap.set(mode, key, command, { desc = desc, silent = true, noremap = true })
end

function setKeymapOnBuf(mode, key, command, desc, buf)
  keymap.set(mode, key, command, { buffer = buf, desc = desc, silent = true, noremap = true })
end

setKeymap("n", "<leader>sv", "<C-w>v", "Split window vertically")
setKeymap("n", "<leader>sh", "<C-w>s", "Split window horizontally")
setKeymap("n", "<leader>se", "<C-w>=", "Make splits equal")
setKeymap("n", "<leader>sx", "<cmd>close<CR>", "Close current split")

setKeymap("n", "<leader>to", "<cmd>tabnew<CR>", "Open new tab")
setKeymap("n", "<leader>tx", "<cmd>tabclose<CR>", "Close current tab")
setKeymap("n", "<leader>tn", "<cmd>tabn<CR>", "Go to next tab")
setKeymap("n", "<leader>tp", "<cmd>tabp<CR>", "Go to previous tab")
setKeymap("n", "<leader>tf", "<cmd>tabnew %<CR>", "Open current buffer in new tab")
setKeymap("n", "<leader>l", ":Lazy<CR>", "Open Lazy")
