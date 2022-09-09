require 'plugins'
require 'options'
require 'keymaps'
require 'completion'
require 'lsp'

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  filters = {
    custom = {"__pycache__"}
  },
  diagnostics = {
    enable = true
  },
  renderer = {
    indent_markers = {
      enable = true 
    },
    icons = {
      git_placement = "after",
      glyphs = {
        git = {
          unstaged = "△",
          staged = "✔",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "✗",
          ignored = "◌",
        }
      }
    }
  },
  view = {
    mappings = {
      list = {
        { key = "t", action = "tabnew"},
        { key = "<C-s>", action = "split"}
      }
    }
  },
})
