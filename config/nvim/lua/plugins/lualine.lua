return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return "✈️  " .. require("copilot_status").status_string()
        end,
      })
    end,
  },
}
