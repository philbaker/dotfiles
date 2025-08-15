return {
  {
    "folke/lazy.nvim",
    version = "*"
  },
  {
    "folke/which-key.nvim",
    version = "3.17.0",
  },
  {
    "nvim-lualine/lualine.nvim",
  },
  {
    "terrortylor/nvim-comment",
  },
  {
    "Olical/nfnl",
    ft = "fennel",
    dependencies = { "norcalli/nvim.lua" },
    init = function()
      require("config")
    end,
  }
}
