return {
  "OscarCreator/rsync.nvim",
  build = "make",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("rsync").setup({
      sync_on_save = true,
    })
  end,
}
