return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- TODO: Is this command enough to lazy load?
    cmd = "DiffviewOpen",
  },
}
