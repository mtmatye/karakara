local M = {}

M.config = function()
  local components = require("lvim.core.lualine.components")

  lvim.builtin.lualine.sections.lualine_a = {
    "mode"
  }
  lvim.builtin.lualine.sections.lualine_b = {
    -- {
    --   function()
    --     return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    --   end,
    -- },
    components.branch,
    components.diff,
  }
  lvim.builtin.lualine.sections.lualine_c = {
    {
      function()
        if not vim.bo.readonly or not vim.bo.modifiable then
          return ""
        end
        return ""
      end,
      color = { fg = "#f7768e" },
    },
    components.python_env,
    {
      function()
        local function format_file_size(file)
          local size = vim.fn.getfsize(file)
          if size <= 0 then
            return ""
          end
          local sufixes = { "b", "kb", "mb", "gb" }
          local i = 1
          while size > 1024 do
            size = size / 1024
            i = i + 1
          end
          local fmt = "%.2f%s"
          if i == 1 then
            fmt = "%d%s"
          end
          return string.format(fmt, size, sufixes[i])
        end

        local file = vim.fn.expand("%:p")
        if string.len(file) == 0 then
          return ""
        end
        return format_file_size(file)
      end,
      cond = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
    },
    {
      "filename",
      path = 1,
      file_status = false,
      color = { fg = "#ffaea4" },
    },
    {
      function() return require("nvim-navic").get_location() end,
      cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
    },
  }
  lvim.builtin.lualine.sections.lualine_x = {
    components.diagnostics,
    -- {
    --   require("noice").api.status.search.get,
    --   cond = package.loaded["noice"] and require("noice").api.status.search.has,
    --   color = { fg = "#ff9e64" },
    -- },
  }
  -- components.lsp.icon = { " ", color = { fg = "#ddd" } }
  lvim.builtin.lualine.sections.lualine_y = {
    components.treesitter,
    components.filetype,
    components.lsp,
    components.spaces,
    -- { "fileformat", color = { fg = "#c2e7f0" } },
  }
  lvim.builtin.lualine.sections.lualine_z = {
    { "%2l:%L | %2c", type = "stl" },
    -- components.scrollbar,
  }
end

return M