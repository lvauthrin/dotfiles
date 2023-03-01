return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        metals = {
          filetypes = { "scala", "sc" },
        },
      },
      setup = {
        metals = function(_, opts)
          require("lspconfig").metals.setup({
            filetypes = { "scala", "sc" },
          })
          return true
        end,
      },
    },
  },
}
