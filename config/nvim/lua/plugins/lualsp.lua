return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.lua_ls = {
        settings = {
          Lua = {
            hint = {
              enable = true,
              arrayIndex = "Disable", -- "Enable", "Auto", "Disable"
              await = true,
              paramName = "Disable", -- "All", "Literal", "Disable"
              paramType = false,
              semicolon = "Disable", -- "All", "SameLine", "Disable"
              setType = true,
            },
            runtime = {
              version = "LuaJIT",
              special = {
                reload = "require",
              },
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = false,
                [vim.fn.stdpath("config") .. "/lua"] = false,
              },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }
    end,
  },
}
