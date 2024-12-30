-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("lspconfig").intelephense.setup({
  root_dir = function()
    return vim.loop.cwd()
  end,
})

require("telescope").setup({})

vim.opt.clipboard = "unnamedplus"

-- Salvamento automático ao sair do modo de inserção ou mover para outro buffer
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified then
      vim.cmd("write") -- Salva o arquivo automaticamente
    end
  end,
})

require("nvim-treesitter.configs").setup({
  ensure_installed = { "php" }, -- Garante que PHP seja instalado
  highlight = {
    enable = true, -- Ativa o destaque de sintaxe
    additional_vim_regex_highlighting = false,
  },
})
