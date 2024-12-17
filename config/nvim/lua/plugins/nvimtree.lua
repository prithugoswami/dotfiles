local tree_width_ratio = 0.18
local tree_height_ratio = 0.82014

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<C-n>', '<cmd>NvimTreeToggle<cr>', desc = 'Open File tree' },
  },
  opts = {
    -- on_attach = nvim_tree_on_attach,
    sort_by = 'case_sensitive',
    update_focused_file = {
      enable = true,
    },
    view = {
      preserve_window_proportions = true,
      centralize_selection = true,
      signcolumn = 'auto',
      float = {
        enable = false,
        quit_on_focus_loss = true,
        open_win_config = function()
          local screen_w = vim.opt.columns:get()
          local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
          local window_w = screen_w * tree_width_ratio
          local window_h = screen_h * tree_height_ratio
          local window_w_int = math.floor(window_w)
          local window_h_int = math.floor(window_h)
          local center_x = (screen_w - window_w) / 2
          local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
          return {
            border = 'rounded',
            relative = 'editor',
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
      custom = { '__pycache__' },
    },
    diagnostics = {
      enable = true,
    },
    actions = {
      open_file = {
        quit_on_open = true,
        window_picker = {
          enable = false,
        },
      },
    },
    tab = {
      sync = {
        open = true,
        close = true,
      },
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        show = {
          file = false,
          folder = false,
        },
        git_placement = 'before',
        glyphs = {
          git = {
            unstaged = '△',
            staged = '✔',
            unmerged = '',
            renamed = '➜',
            untracked = '★',
            deleted = '✗',
            ignored = '◌',
          },
        },
      },
    },
  },
}
