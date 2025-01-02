-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Configurar keymap para comentar várias linhas
vim.keymap.set("n", "<C-;>", "<Plug>(comment_toggle_linewise)", { desc = "Toggle comment for line" }) -- Modo normal
vim.keymap.set("v", "<C-;>", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment for selection" }) -- Modo visual

-- Sair com Ctrl + Q
vim.keymap.set("n", "<C-q>", ":q<CR>", { desc = "Sair do Neovim" })

-- Copiar com Ctrl + C (em modo visual)
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copiar para a área de transferência do sistema" })

-- Colar com Ctrl + V
vim.keymap.set("n", "<C-v>", '"+p', { desc = "Colar da área de transferência do sistema" })
vim.keymap.set("i", "<C-v>", "<C-r>+", { desc = "Colar da área de transferência no modo de inserção" })

-- Cortar com Ctrl + X (em modo visual)
vim.keymap.set("v", "<C-x>", '"+d', { desc = "Cortar para a área de transferência do sistema" })

--Find references using LSP and Telescope
vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>:Telescope lsp_references<CR>", { noremap = true, silent = true })

-- Configura o mapeamento de hover para a tecla K
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

