--if true then
--  return {}
--end

-- Taken from: https://www.reddit.com/r/neovim/comments/1172p03/jdtls_spams_messages_in_lazyvim/

-- nvim has lsp client built-in
-- mason and mason-lspconfigs have configurations to install servers
-- nvim-lspconfig has client configs to start the server and attach to it
-- nvim-jdtls does the same as nvim-lspconfig except that it doesn't add the file hook

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "jdtls",
      },
    },
  },
  -- TODO: Needed to run TSInstsall java but should have been installed with the following?
  -- add typescript to treesitter
  --{
  --  "nvim-treesitter/nvim-treesitter",
  --  opts = function(_, opts)
  --    if type(opts.ensure_installed) == "table" then
  --      vim.list_extend(opts.ensure_installed, { "java" })
  --    end
  --  end,
  --},
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "mfussenegger/nvim-jdtls",
      },
    },
    ft = "java",
    opts = {
      setup = {
        server = {
          jdtls = {},
        },
        jdtls = function(_, opts)
          --          local jdtls = require("jdtls")
          --          local home = os.getenv("HOME")
          --          local root_markers = { "pom.xml", "gradlew", "mvnw", ".git" }
          --          local root_dir = jdtls.setup.find_root(root_markers)
          --          require("notify")("Setting up jdtls in: " .. root_dir)
          --
          --          local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
          --          require("notify")("Setting up workspace_folder in: " .. workspace_folder)
          --
          --          local on_attach = function(client, bufnr)
          --            require("notify")("Attaching... " .. bufnr)
          --            --jdtls.setup_dap({ hotcodereplace = "auto" })
          --            jdtls.setup.add_commands()
          --
          --            -- Default keymaps
          --            require("lsp.defaults").on_attach(client, bufnr)
          --
          --            -- Java extensions
          --            vim.keymap.set(
          --              "n",
          --              "<leader>cji",
          --              "<Cmd>lua require'jdtls'.organize_imports()<CR>",
          --              { buffer = bufnr, desc = "Organize Imports" }
          --            )
          --            --vim.keymap.set(
          --            --  "n",
          --            --  "<leader>cjt",
          --            --  "<Cmd>lua require'jdtls'.test_class()<CR>",
          --            --  { buffer = bufnr, desc = "Test Class" }
          --            --)
          --            --vim.keymap.set(
          --            --  "n",
          --            --  "<leader>cjn",
          --            --  "<Cmd>lua require'jdtls'.test_nearest_method()<CR>",
          --            --  { buffer = bufnr, desc = "Test Nearest Method" }
          --            --)
          --            vim.keymap.set(
          --              "v",
          --              "<leader>cje",
          --              "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
          --              { buffer = bufnr, desc = "Extract Variable" }
          --            )
          --            vim.keymap.set(
          --              "n",
          --              "<leader>cjee",
          --              "<Cmd>lua require('jdtls').extract_variable()<CR>",
          --              { buffer = bufnr, desc = "Extract Variable" }
          --            )
          --            vim.keymap.set(
          --              "v",
          --              "<leader>cjm",
          --              "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
          --              { buffer = bufnr, desc = "Extract Method" }
          --            )
          --          end
          --
          --          --    local capabilities = vim.lsp.protocol.make_client_capabilities()
          --          --    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
          --
          --          local JDTLS_LOCATION = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
          --
          --          local config = {
          --            --      --capabilities = capabilities,
          --            autostart = true,
          --            --      filetypes = { "java" },
          --            --      --java = {
          --            --      --  eclipse = {
          --            --      --    downloadSources = true,
          --            --      --  },
          --            --      --},
          --            --      --init_options = {},
          --            root_dir = root_dir,
          --            on_attach = on_attach,
          --            cmd = {
          --              JDTLS_LOCATION .. "/bin/jdtls",
          --              "-configuration",
          --              "/Users/lvauthrin/.cache/jdtls/config",
          --              "-data",
          --              "/Users/lvauthrin/.cache/jdtls/workspace",
          --            },
          --          }
          --
          --          jdtls.start_or_attach(config)
          return true
        end,
      },
    },
  },
}
