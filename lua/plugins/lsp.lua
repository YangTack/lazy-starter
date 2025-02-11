local function clangd_cmd()
  local query_driver = os.getenv("QUERY_DRIVER")
  local cmd = {
    "clangd",
    "--clang-tidy",
    "-j=4",
    "--fallback-style=microsoft",
  }
  if query_driver then
    table.insert(cmd, "--query-driver=" .. query_driver)
  end
  return cmd
end

local function get_python_path()
  local python_path = io.popen("which python"):read()
  return python_path
end

return {
  {
    "neovim/nvim-lspconfig",
    version = "*",
    opts = {
      inlay_hints = { enabled = true },
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
      servers = {
        basedpyright = {
          settings = {
            python = {
              pythonPath = get_python_path(),
            },
            basedpyright = {
              analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
                reportIncompatibleMethodOverride = "no",
                reportIncompatibleVariableOverride = "warning",
                reportDeprecated = "warning",
                diagnosticSeverityOverrides = {
                  reportIncompatibleVariableOverride = "warning",
                  reportIncompatibleMethodOverride = "warning",
                  reportDeprecated = "warning",
                  reportMissingSuperCall = "warning",
                },
              },
            },
          },
        },
        clangd = {
          cmd = clangd_cmd(),
        },
      },
    },
  },
  {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("inlay-hints").setup()
    end,
  },
  -- {
  --   "mrcjkb/rustaceanvim",
  --   enabled = false,
  -- },
}
