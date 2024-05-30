return {
  -- VSCode theme
  -- {
  --     "Mofiqul/vscode.nvim",
  --     priority = 1000, -- Make sure to load this before all the other start plugins.
  --     enabled = true,
  --     lazy = false,
  -- },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000, enabled = false, lazy = false },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
    enabled = true,
    lazy = false,
    opts = {
      styles = {
        comments = { italic = true },
        keywords = { bold = true },
        functions = { italic = true },
      },
    },
  },
  -- Configure LazyVim to load vscode
  {
    "LazyVim/LazyVimw",
    opts = {
      colorscheme = "tokyonight-storm",
    },
  },
}
