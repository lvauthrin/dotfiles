return {
  -- Flutter commands like hot-reload-on-save
  {
    "akinsho/flutter-tools.nvim",
    config = true,
    ft = "dart",
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.dartls = {}
    end,
  },
}
