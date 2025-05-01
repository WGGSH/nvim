return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "left",
      mappings = {
        D = "delete",
        d = "parent_or_close",
        h = "none",
        t = "none",
        n = "child_or_open",
      },
    },
    default_component_configs = {
      indent = {
        padding = 0,
        last_indent_marker = "└─",
      }
    }
  },
}
