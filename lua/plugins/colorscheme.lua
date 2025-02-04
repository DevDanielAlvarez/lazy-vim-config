return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Garante que ele seja carregado antes de outros plugins
    config = function()
      require("catppuccin").setup({
        flavour = "latte", -- Opções: latte, frappe, macchiato, mocha
        integrations = {
          treesitter = true,
          native_lsp = { enabled = true },
          cmp = true,
          gitsigns = true,
          telescope = true,
          nvimtree = true,
          which_key = true,
        },
      })

      -- Define o colorscheme
    end,
  },
}
