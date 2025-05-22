return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  init = function()
    -- do nothing
  end,
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          -- hide_gitignored = true,
        },
        follow_current_file = {
          enabled = true,
        },
      },
    })
  end,
  keys = {
    { "<leader>nn", "<cmd>Neotree filesystem reveal left<cr>", desc = "Show filesystem" },
    { "<leader>nb", "<cmd>Neotree buffers reveal left<cr>", desc = "Show buffers" },
    { "<leader>ng", "<cmd>Neotree git_status reveal left<cr>", desc = "Show git status" },
  }
}
