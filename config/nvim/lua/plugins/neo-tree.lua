return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      -- NOTE: Example of notification
      -- require("notify")("Changing neo-tree config")
      opts.source_selector = {
        winbar = true,
        statusline = false,
      }
    end,
  },
}
