require 'plugins'
require 'options'
require 'keymaps'
require 'completion'
require 'lsp'
require 'highlights'
require 'snippets'
require 'jq'

-- TODO move each plugin setup to own file
local function nvim_tree_on_attach(bufnr)
  local api = require('nvim-tree.api')
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
  vim.keymap.set('n', '<C-s>', api.node.open.horizontal, opts('Open: Horizontal Split'))
end


-- TODO implement min-width option
local tree_width_ratio = 0.3
local tree_height_ratio = 0.82014 

require("nvim-tree").setup({
  on_attach = nvim_tree_on_attach,
  sort_by = "case_sensitive",
  update_focused_file = {
    enable = true,
  },
  view = {
    centralize_selection = true,
    signcolumn = "auto",
    float = {
      enable = true,
      quit_on_focus_loss = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * tree_width_ratio
        local window_h = screen_h * tree_height_ratio
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                         - vim.opt.cmdheight:get()
        return {
          border = "rounded",
          relative = "editor",
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
        end,
    },
    width = function()
      return math.floor(vim.opt.columns:get() * tree_width_ratio)
    end,
  },
  filters = {
    custom = {"__pycache__"}
  },
  diagnostics = {
    enable = true
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = false 
    },
    icons = {
      show = {
        file = false,
        folder = false,
      },
      git_placement = "before",
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

require("symbols-outline").setup()

require('gitblame').setup {
     --Note how the `gitblame_` prefix is omitted in `setup`
    enabled = false,
}

require('telescope').load_extension('fzf')

-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = { "python", "hcl", "json", "go", "lua", "javascript", "typescript", "html", "css", "c", "cpp", "rust" },
--   sync_install = false,
--   auto_install = true,
--   -- ignore_install = { "javascript" },
--   highlight = {
--     enable = true,
--     disable = { "help"},

--     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--     -- Using this option may slow down your editor, and you may see some duplicate highlights.
--     -- Instead of true it can also be a list of languages
--     additional_vim_regex_highlighting = true,
--   },
--   indent = {
--     enable = false,
--     disable = {"hcl", "python"}
--   }
-- }

-- Test runner options
vim.cmd('let test#strategy = "neovim_sticky"')
vim.cmd('let test#neovim#term_position = "vert botright"')

-- TODO move to seperate autocmd file
vim.cmd ([[
  autocmd FileType html,javascript,lua,typescript,yaml setlocal ts=2 sts=2 sw=2
  autocmd FileType hcl setlocal ts=2 sts=2 sw=2
  autocmd BufRead  *jsx setlocal sw=2
  autocmd BufRead  *tsx setlocal sw=2
  autocmd FileType markdown setlocal spell
]])

vim.cmd('let g:copilot_enabled = 0')
