return {
  -- Dart syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add dart
      vim.list_extend(opts.ensure_installed, {
        "dart",
      })
    end,
  },
}
