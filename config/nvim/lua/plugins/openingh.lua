return {
  {
    "almo7aya/openingh.nvim",
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
