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

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<Esc>'] = require('telescope.actions').close,
        ['<C-j>'] = require('telescope.actions').move_selection_next,
        ['<C-k>'] = require('telescope.actions').move_selection_previous,
      }
    },
  },
  pickers = {
    find_files = {
      previewer = false,
      layout_config = {
        width = {0.5, max=80, min=60}
      }
    },
    buffers = {
      previewer = false,
      layout_config = {
        width = {0.5, max=80, min=60}
      }
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
require('telescope').load_extension('fzf')

-- TODO move to seperate autocmd file
vim.cmd ([[
  autocmd FileType html,javascript,lua,typescript,yaml setlocal ts=2 sts=2 sw=2
  autocmd BufRead  *jsx setlocal sw=2
]])
