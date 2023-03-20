local M = {}

M.config = function()
  lvim.plugins = {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      config = function()
        require("user.config.catppuccin").config()
        vim.cmd([[colorscheme catppuccin]])
        lvim.builtin.lualine.options.theme = "catppuccin"
      end,
    },
    {
      "folke/noice.nvim",
      -- enabled = false,
      config = function()
        require("user.config.noice").config()
      end,
      dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
      }
    },
    {
      "kyazdani42/nvim-tree.lua",
      config = function()
        require("nvim-tree").setup({
          update_focused_file = {
            update_root = false,
          },
        })
      end,
    },
    {
      "kana/vim-textobj-user",
    },
    {
      "kana/vim-textobj-entire",
      dependencies = { "kana/vim-textobj-user" }
    },
    {
      "kana/vim-textobj-indent",
      dependencies = { "kana/vim-textobj-user" }
    },
    {
      "kana/vim-textobj-line",
      dependencies = { "kana/vim-textobj-user" }
    },
    {
      "sgur/vim-textobj-parameter",
      dependencies = { "kana/vim-textobj-user" }
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    {
      "tpope/vim-repeat",
    },
    {
      "tpope/vim-surround",
      keys = { "c", "d", "y" },
    },

  }
end

return M
