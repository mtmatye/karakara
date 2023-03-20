local M = {}

M.config = function()
  lvim.plugins = {
    --------------
    -- 屏幕滚动 --
    --------------
    {
      "karb94/neoscroll.nvim",
      event = "WinScrolled",
      config = function()
        require("user.config.neoscroll").config()
      end,
    },
    --------------
    -- 光标移动 --
    --------------
    {
      "rhysd/clever-f.vim",
      keys = { "f", "F", "t", "T" },
      init = function()
        require("user.setup.clever-f").setup()
      end,
    },
    {
      "phaazon/hop.nvim",
      -- cmd = "Hop*",
      config = function()
        require("user.config.hop").config()
      end,
    },
    {
      "andymass/vim-matchup",
      event = "CursorMoved",
      init = function()
        require("user.setup.matchup").setup()
      end,
    },
    --------------
    -- 标签跳转 --
    --------------
    {
      "ethanholz/nvim-lastplace",
      event = "BufRead",
      config = function()
        require("user.config.lastplace").config()
      end,
    },
    {
      "MattesGroeger/vim-bookmarks",
      event = "BufRead",
      init = function()
        require("user.setup.bookmarks").setup()
      end,
      config = function()
        require("user.config.bookmarks").config()
      end,
    },
    {
      "tom-anders/telescope-vim-bookmarks.nvim",
      keys = { "ml", "mL" },
      config = function()
        require("user.config.telescope-vim-bookmarks").config()
      end,
    },
    --------------
    -- 全文搜索 --
    --------------
    {
      "bronson/vim-visual-star-search",
      keys = { { "v", "*" }, { "v", "#" }, { "v", "g*" }, { "v", "g#" } },
    },
    {
      "romainl/vim-cool",
      event = "CursorMoved",
    },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      keys = { "<C-S-F>" },
      config = function()
        require("user.config.telescope-live-grep-args").config()
      end,
    },
    {
      "windwp/nvim-spectre",
      keys = { "<C-h>", { "v", "C-h>" }, "<C-S-H>", { "v", "<C-S-H>" } },
      config = function()
        require("user.config.spectre").config()
      end,
    },
    --------------
    -- 快速编辑 --
    --------------
    {
      "mg979/vim-visual-multi",
      keys = { "<C-n>", { "v", "<C-n>" }, "<C-S-L>", { "v", "<C-S-L>" }, "ma", { "v", "ma" } },
      init = function()
        require("user.setup.visual-multi").setup()
      end,
      config = function()
        require("user.config.visual-multi").config()
      end,
    },
    --------------
    -- 普通模式 --
    --------------
    {
      "terryma/vim-expand-region",
      keys = { { "v", "v" }, { "v", "V" } },
      config = function()
        require("user.config.expand-region").config()
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
    --------------
    -- 语言服务 --
    --------------
    {
      "j-hui/fidget.nvim",
      event = "BufRead",
      config = function()
        require("user.config.fidget").config()
      end,
    },
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("user.config.lsp_signature").config()
      end,
    },
    {
      "benfowler/telescope-luasnip.nvim",
      keys = { "<M-i>" },
      config = function()
        require("user.config.telescope-luasnip").config()
      end,
    },
    {
      "tamago324/cmp-zsh",
      config = function()
        require("user.config.cmp_zsh").config()
      end,
      dependencies = { "Shougo/deol.nvim" },
    },
    {
      "p00f/clangd_extensions.nvim",
      ft = { "c", "cpp", "objc", "objcpp" },
      config = function()
        require("user.config.clangd_extensions").config()
      end,
    },
    {
      "windwp/nvim-ts-autotag",
    },
    --------------
    -- 文件操作 --
    --------------
    {
      "lambdalisue/suda.vim",
      cmd = { "SudaRead", "SudaWrite" },
    },
    {
      "folke/persistence.nvim",
      event = "BufReadPre", -- this will only start session saving when an actual file was opened
      -- module = "persistence",
      lazy = true,
      config = function()
        require("user.config.persistence").config()
      end,
    },
    {
      "nvim-tree/nvim-tree.lua",
      config = function()
        require("nvim-tree").setup {
          update_focused_file = {
            update_root = false,
          },
        }
      end
    },
    --------------
    -- 界面元素 --
    --------------
    {
      "petertriho/nvim-scrollbar",
      config = function()
        require("user.config.scrollbar").config()
      end,
    },
    {
      "sidebar-nvim/sidebar.nvim",
      -- cmd = "Sidebar*",
      config = function()
        require("user.config.sidebar").config()
      end,
    },
    {
      "simrat39/symbols-outline.nvim",
      -- cmd = "SymbolsOutline*",
      config = function()
        require("user.config.symbols-outline").config()
      end,
    },
    {
      "folke/todo-comments.nvim",
      event = "BufRead",
      config = function()
        require("user.config.todo-comments").config()
      end,
    },
    {
      "mbbill/undotree",
      -- cmd = { "Undotree*" },
    },
    {
      "folke/trouble.nvim",
      -- cmd = { "Trouble*" },
      config = function()
        require("user.config.trouble").config()
      end,
    },
    {
      "kevinhwang91/nvim-bqf",
      event = { "BufRead", "BufNew" },
      config = function()
        require("user.config.bqf").config()
      end,
    },
    {
      "stevearc/dressing.nvim",
      event = "BufWinEnter",
      config = function()
        require("user.config.dressing").config()
      end,
    },
    --------------
    -- 界面美化 --
    --------------
    {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      init = function()
        vim.g.indentLine_enabled = 1
        vim.g.indent_blankline_char = "▏"
        vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard", "alpha", "packer" }
        vim.g.indent_blankline_buftype_exclude = { "terminal", "quickfix", "nofile", "help" }
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        vim.g.indent_blankline_show_first_indent_level = false
      end,
    },
    {
      "p00f/nvim-ts-rainbow",
    },
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("user.config.colorizer").config()
      end,
    },
    {
      "abzcoding/tokyonight.nvim",
      name = "tokyo-night",
      branch = "feat/local",
      config = function()
        require("user.config.tokyonight").config()
        vim.cmd([[colorscheme tokyonight]])
        -- lvim.builtin.lualine.options.theme = "tokyonight"
      end,
      -- cond = function()
      --   local _time = os.date("*t")
      --   return _time.hour >= 15 and _time.hour < 24
      -- end,
    },
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
      -- enabled = false,
      dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        -- "rcarriga/nvim-notify",
      }
    },

    {
      "RRethy/nvim-base16",
      config = function()
        vim.cmd([[colorscheme base16-gruvbox-dark-hard]])
      end
    },
    --------------
    -- 其他功能 --
    --------------
    {
      "voldikss/vim-translator",
      -- cmd = { "Translate*" },
      init = function()
        require("user.setup.translator").setup()
      end,
    },
    {
      "fedorenchik/VimCalc3",
      cmd = { "Calc" },
    },

    {
      "simrat39/rust-tools.nvim",
      -- enabled = false,
      ft = { "rust", "rs" }, -- IMPORTANT: re-enabling this seems to break inlay-hints
      config = function()
        require("rust-tools").setup {
          server = {
            -- standalone = false,
            on_init = require("lvim.lsp").common_on_init,
            on_attach = function(client, bufnr)
              require("lvim.lsp").common_on_attach(client, bufnr)
              local rt = require "rust-tools"
              -- Hover actions
              vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
              -- Code action groups
              vim.keymap.set("n", "<leader>lA", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
          },
        }
      end,
    },
  }
end

return M
