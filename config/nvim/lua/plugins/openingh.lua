return {
  {
    "almo7aya/openingh.nvim",
    config = true,
    keys = {
      {
        "ghf",
        function()
          require("openingh").openFile()
        end,
        desc = "Open current file in Github",
      },
      {
        "ghr",
        function()
          require("openingh").openRepo()
        end,
        desc = "Open current repo in Github",
      },
    },
  },
}
