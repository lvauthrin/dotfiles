return {
  -- Note: this is a plugin I'm developing to learn more about nvim
  -- {
  --   "lvauthrin/chatgpt.nvim",
  --   dir = os.getenv("HOME") .. "/code/chat-gpt.nvim/curl-module",
  --   dev = true,
  --   lazy = false,
  --   --enabled = false,
  --   config = function(_, _)
  --     require("chatgpt").setup({ api_key = os.getenv("OPENAI_API_KEY") })
  --   end,
  -- },
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      openai_params = {
        model = "gpt-3.5-turbo",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 300,
        temperature = 0,
        top_p = 1,
        n = 1,
      },
    },
    config = function(_, opts)
      require("chatgpt").setup(opts)
    end,
    lazy = false,
  },
}
