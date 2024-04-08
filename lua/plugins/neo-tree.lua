return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = 'float',
      mappings = {
        D = 'delete',
        d = "parent_or_close",
        h = "none",
        t = "none",
        n = "child_or_open",
      }
    },
  }
}
