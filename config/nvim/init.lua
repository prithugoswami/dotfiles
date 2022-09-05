require 'plugins'
require 'options'
require 'keymaps'


-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
})
