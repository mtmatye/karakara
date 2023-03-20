local M = {}

M.config = function()
  -- ---@usage disable automatic installation of servers
  -- lvim.lsp.installer.setup.automatic_installation = false

  -- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
  -- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
  -- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
  -- local opts = {} -- check the lspconfig documentation for a list of all possible options
  -- require("lvim.lsp.manager").setup("pyright", opts)

  -- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
  -- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
  -- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  --   return server ~= "emmet_ls"
  -- end, lvim.lsp.automatic_configuration.skipped_servers)

  -- -- you can set a custom on_attach function that will be used for all the language servers
  -- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
  -- lvim.lsp.on_attach_callback = function(client, bufnr)
  --   local function buf_set_option(...)
  --     vim.api.nvim_buf_set_option(bufnr, ...)
  --   end
  --   --Enable completion triggered by <c-x><c-o>
  --   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  -- end

  -- -- set a formatter, this will override the language server formatting capabilities (if it exists)
  local formatters = require "lvim.lsp.null-ls.formatters"
  formatters.setup {
    { command = "black", filetypes = { "python" } },
    { command = "isort", filetypes = { "python" } },
    {
      -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
      command = "prettier",
      ---@usage arguments to pass to the formatter
      -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
      extra_args = { "--print-with", "100" },
      ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
      filetypes = { "typescript", "typescriptreact" },
    },
    {
      command = "rustfmt", filetypes = { "rust" },
    }
  }

  -- -- set additional linters
  local linters = require "lvim.lsp.null-ls.linters"
  linters.setup {
    { command = "flake8", filetypes = { "python" } },
    {
      -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
      command = "shellcheck",
      ---@usage arguments to pass to the formatter
      -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
      extra_args = { "--severity", "warning" },
    },
    {
      command = "codespell",
      ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
      filetypes = { "javascript", "python" },
    },
  }

  -- ---WARN: configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
  -- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
  vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

  require("lvim.lsp.null-ls.linters").setup({
    { filetypes = { "sh" },                                                             command = "shellcheck" },
    { filetypes = { "go" },                                                             command = "golangci_lint" },
    { filetypes = { "python" },                                                         command = "pylint" },
    { filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, command = "eslint" },
    { filetypes = { "html" },                                                           command = "tidy" },
    { filetypes = { "css" },                                                            command = "stylelint" },
    { filetypes = { "markdown" },                                                       command = "markdownlint", args = { "--disable", "MD013" } },
  })

  lvim.format_on_save = { pattern = "*", timeout = 2000 }
  require("lvim.lsp.null-ls.formatters").setup({
    { filetypes = { "sh" },                                                             command = "shfmt",       extra_args = { "-i", "2" } },
    { filetypes = { "cmake" },                                                          command = "cmake_format" },
    { filetypes = { "go" },                                                             command = "gofmt" },
    { filetypes = { "python" },                                                         command = "yapf",        args = { "--style={based_on_style: google, column_limit: 120, indent_width: 4}" } },
    { filetypes = { "lua" },                                                            command = "stylua" },
    { filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, command = "prettier" },
    { filetypes = { "html", "css", "markdown" },                                        command = "prettier" },
  })
end

return M
