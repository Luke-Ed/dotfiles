vim.lsp.enable("basedpyright")
vim.lsp.enable("pylsp")
vim.lsp.enable("ruff")
vim.lsp.enable("taplo")
vim.lsp.enable("markdown_oxide")
vim.lsp.config("harper_ls", {
  settings = {
    ["harper-ls"] = {
      linters = {
        SpellCheck = true
      }
    }
  }
})
vim.lsp.enable("harper_ls")

vim.o.number = true
vim.o.visualbell = true
vim.o.syntax = on
vim.o.showcmd = true
vim.o.wildmenu = true
vim.o.lazyredraw = true
vim.o.showmatch = true
vim.o.wrap = true
vim.o.colorcolumn = "100,120"
vim.o.cindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true

require("mini.completion").setup()
require("mini.statusline").setup()
require("mini.tabline").setup()
require("mini.trailspace").setup()
local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
})

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  signs = true,
  update_in_insert = true
})


local diagnostic_hover_timer = nil
local HOVER_DELAY = 250

local function clear_timer()
  if diagnostic_hover_timer then
    diagnostic_hover_timer:stop()
    diagnostic_hover_timer = nil
  end
end

vim.api.nvim_create_autocmd({"CursorMoved", "InsertEnter", "BufLeave"}, {
  callback = clear_timer,
})

vim.api.nvim_create_autocmd("CursorMoved", {
  callback = function()
    diagnostic_hover_timer = vim.defer_fn(function()
      vim.diagnostic.open_float(nil, {
        focus = false,
        scope = cursor,
        close_events = {
          "CursorMoved",
          "InsertEnter",
          "BufLeave",
        },
        source = "if_many",
        border = "rounded",
      })
    end, HOVER_DELAY)
  end,
})

