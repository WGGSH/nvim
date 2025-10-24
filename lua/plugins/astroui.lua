---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    -- colorscheme = "astrodark",
    colorscheme = "catppuccin",
    -- colorscheme = "everforest",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
        -- ConflictMarkerBegin = { bg = "#4a8277" },
        -- ConflictMarkerOurs = { bg = "#4a8277" },
        -- ConflictMarkerTheirs = { bg = "#4085c2" },
        -- ConflictMarkerEnd = { bg = "#4085c2" },
        -- ConflictMarkerSeparator = { bg = "none" },
        CursorLine = { underline = true, fg= "none", bg= "none" },
      },
      everforest = {
        BufferCurrentError = { link = "Normal" },
        BufferCurrentWarn = { link = "Normal" },
        BufferCurrentADDED = { link = "Normal" },
        BufferCurrentCHANGED = { link = "Normal" },
        BufferCurrentDELETED = { link = "Normal" },
      },
      astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
