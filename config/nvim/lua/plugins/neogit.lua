return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'sindrets/diffview.nvim', opts = { enhanced_diff_hl = true } },
    'nvim-telescope/telescope.nvim',
  },
  config = true,
}
