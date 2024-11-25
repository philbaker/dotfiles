return {
  {
    "folke/lazy.nvim",
    version = "*"
  },
  {
    "folke/which-key.nvim",
    version = "1.6.0",
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
