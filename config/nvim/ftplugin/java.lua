-- Taken from: https://www.reddit.com/r/neovim/comments/1172p03/jdtls_spams_messages_in_lazyvim/

local jdtls = require("jdtls")
local home = os.getenv("HOME")
local root_markers = { "pom.xml", "gradlew", "mvnw", ".git" }
local root_dir = jdtls.setup.find_root(root_markers)
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local on_attach = function(client, bufnr)
  --jdtls.setup_dap({ hotcodereplace = "auto" })
  jdtls.setup.add_commands()

  -- Debugging
  --vim.keymap.set(
  --  "n",
  --  "<leader>cjt",
  --  "<Cmd>lua require'jdtls'.test_class()<CR>",
  --  { buffer = bufnr, desc = "Test Class" }
  --)
  --vim.keymap.set(
  --  "n",
  --  "<leader>cjn",
  --  "<Cmd>lua require'jdtls'.test_nearest_method()<CR>",
  --  { buffer = bufnr, desc = "Test Nearest Method" }
  --)
  -- Java extensions
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

local JDTLS_LOCATION = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

local config = {
  capabilities = capabilities,
  autostart = true,
  root_dir = root_dir,
  on_attach = on_attach,
  cmd = {
    JDTLS_LOCATION .. "/bin/jdtls",
    "-configuration",
    "/Users/lvauthrin/.cache/jdtls/config",
    "-data",
    "/Users/lvauthrin/.cache/jdtls/workspace",
  },
}

jdtls.start_or_attach(config)
