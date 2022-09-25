require 'plugins'
require 'options'
require 'keymaps'
require 'completion'
require 'lsp'

-- TODO move each plugin setup to own file

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
      show = {
        file = false,
        folder = false,
      },
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

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "hcl", "json", "go", "lua", "javascript", "typescript", "html", "css", "c", "cpp", "rust" },
  sync_install = false,
  auto_install = true,
  -- ignore_install = { "javascript" },
  highlight = {
    enable = true,
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = false,
    disable = {"hcl", "python"}
  }
}

local null_ls = require("null-ls")

null_ls.setup({
  debug = false,
  sources = {
    -- (java|type)script
    null_ls.builtins.formatting.prettier,
    -- python
    null_ls.builtins.formatting.black.with({extra_args={"--fast"}}),
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.flake8.with({
      condition = function(utils)
        return utils.root_has_file({".flake8"})
      end,
    }),
    null_ls.builtins.diagnostics.mypy.with({
      condition = function(utils)
        return utils.root_has_file({"pyproject.toml"})
      end,
    }),
  }
})

-- TODO move to seperate autocmd file
vim.cmd ([[
  autocmd FileType html,javascript,lua,typescript,yaml setlocal ts=2 sts=2 sw=2
  autocmd BufRead  *jsx setlocal sw=2
  autocmd BufRead  *tsx setlocal sw=2
]])
