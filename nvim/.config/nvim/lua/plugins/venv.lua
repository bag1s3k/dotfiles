return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    { "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  ft = "python", -- Load when opening Python files
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Choose python venv" },
  },
  opts = {
    options = {
      notify_user_on_venv_activation = true,
    },
  },
}
