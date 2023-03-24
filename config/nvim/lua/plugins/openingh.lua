return {
  {
    "lvauthrin/openingh.nvim",
    -- TODO: Switch back to original repo after PR merge
    --"almo7aya/openingh.nvim",
    --dir = "~/code/openingh.nvim",
    --dev = true,
    --config = true,
    cmd = { "OpenInGHFile", "OpenInGHRepo " },
    keys = {
      {
        "ghf",
        ":OpenInGHFile <cr>",
        mode = { "n", "v" },
        desc = "Open current file in Github",
        silent = true,
      },
      {
        "ghr",
        ":OpenInGHRepo <cr>",
        mode = "n",
        desc = "Open current repo in Github",
        silent = true,
      },
    },
  },
}
