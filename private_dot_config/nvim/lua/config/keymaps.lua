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
setKeymap("n", "<leader>u", ":UndotreeToggle<cr>")
