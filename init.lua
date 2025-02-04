-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("telescope").setup({})

vim.opt.clipboard = "unnamedplus"

-- Salvamento automático ao sair do modo de inserção ou mover para outro buffer
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = "*",
  callback = function()
    -- Só salva se NÃO for um buffer especial (como janelas flutuantes e terminais)
    if vim.bo.modified and vim.bo.buftype == "" then
      vim.cmd("write")
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

require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true, -- Mostra arquivos ocultos
      hide_dotfiles = false, -- Exibe arquivos que começam com "."
      hide_gitignored = false, -- Exibe arquivos ignorados pelo Git
    },
  },
})

-- ** Adicionando o código solicitado para exibir informações após 3 segundos **

-- Usando o LSP e o hover após 3 segundos
vim.cmd([[
augroup LSPHover
  autocmd!
  autocmd CursorHold * lua vim.lsp.buf.hover()
augroup END
]])

-- Configuração para o LSP do Intelephense
require("lspconfig").intelephense.setup({
  root_dir = function()
    return vim.loop.cwd()
  end,
})

-- Usando o lspkind para ícones no hover
require("lspkind").init({
  -- Opções de configuração para mostrar ícones ao lado das informações
  mode = "symbol", -- Mostra ícones ao invés de texto, se preferir
  preset = "default",
})

-- Configura o tempo de espera para 3 segundos (3000ms) antes de mostrar o hover
vim.opt.updatetime = 2000
vim.cmd.colorscheme("catppuccin")

vim.api.nvim_set_hl(0, "Cursor", { bg = "#FF0000", fg = "white" }) -- Cursor vermelho forte com texto branco
vim.opt.guicursor = "n-v-c:block-Cursor" -- Usa um bloco sólido para o cursor

-- Ativar destaque da linha atual
vim.opt.cursorline = true

-- Definir o fundo da linha atual para um amarelo bem clarinho
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#D3D3D3" })

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000", fg = "#abb2bf" }) -- Exemplo de cores
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e222a", fg = "#61afef" }) -- Ajusta a borda flutuante
