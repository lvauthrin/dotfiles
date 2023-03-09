local M = {}

-- TODO: A lot of this could probably be cached
M.load_jdtls = function()
  local jdtls = require("jdtls")
  local home = os.getenv("HOME")
  local root_markers = { "pom.xml", "gradlew", "mvnw", ".git" }
  local root_dir = jdtls.setup.find_root(root_markers)
  local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

  local on_attach = function(_, bufnr)
    jdtls.setup_dap({ hotcodereplace = "auto" })
    -- TODO: Figure out why this isn't working: 'No LSP client found that supports vscode.java.resolveMainClass'
    --require("jdtls.dap").setup_dap_main_class_configs()

    jdtls.setup.add_commands()

    vim.keymap.set(
      "n",
      "<leader>ctc",
      "<Cmd>lua require'jdtls'.test_class()<CR>",
      { buffer = bufnr, desc = "Test Class" }
    )
    vim.keymap.set(
      "n",
      "<leader>ctm",
      "<Cmd>lua require'jdtls'.test_nearest_method()<CR>",
      { buffer = bufnr, desc = "Test Nearest Method" }
    )
    vim.keymap.set(
      "n",
      "<leader>ci",
      "<Cmd>lua require'jdtls'.organize_imports()<CR>",
      { buffer = bufnr, desc = "Organize Imports" }
    )
    vim.keymap.set(
      "v",
      "<leader>ces",
      "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
      { buffer = bufnr, desc = "Extract Variable" }
    )
    vim.keymap.set(
      "n",
      "<leader>cev",
      "<Cmd>lua require('jdtls').extract_variable()<CR>",
      { buffer = bufnr, desc = "Extract Variable" }
    )
    vim.keymap.set(
      "v",
      "<leader>cem",
      "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
      { buffer = bufnr, desc = "Extract Method" }
    )
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  local mason_packages_path = vim.fn.stdpath("data") .. "/mason/packages"
  local jdts_location = mason_packages_path .. "/jdtls"
  local dap_jar_location = mason_packages_path
    .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
  local debug_test_jar_location = mason_packages_path .. "/java-test/extension/server/*.jar"

  local bundles = {
    dap_jar_location,
  }

  vim.list_extend(bundles, vim.split(vim.fn.glob(debug_test_jar_location), "\n"))

  local config = {
    capabilities = capabilities,
    autostart = true,
    root_dir = root_dir,
    on_attach = on_attach,
    init_options = {
      bundles = bundles,
    },
    settings = {
      java = {
        eclipse = {
          downloadSources = true,
        },
        configuration = {
          updateBuildConfiguration = "interactive",
          runtimes = {
            {
              name = "JavaSE-17",
              path = "~/.sdkman/candidates/java/17.0.5-tem",
            },
          },
        },
      },
    },
    cmd = {
      jdts_location .. "/bin/jdtls",
      "-configuration",
      home .. "/.cache/jdtls/config",
      "-data",
      workspace_folder,
    },
  }

  jdtls.start_or_attach(config)
end

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
        "mfussenegger/nvim-dap",
      },
    },
    opts = {
      setup = {
        jdtls = function(_, _)
          -- TODO: On Reddit, it was suggested that using ftplugin would be better:
          --  https://www.reddit.com/r/neovim/comments/11k3zuv/comment/jba4dv3/?utm_source=share&utm_medium=web2x&context=3
          vim.api.nvim_create_autocmd("FileType", {
            pattern = "java",
            callback = M.load_jdtls,
          })

          return true
        end,
      },
    },
  },
}
