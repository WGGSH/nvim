-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      -- old: diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      -- opt = { -- vim.opt.<key>
      --   relativenumber = true, -- sets vim.opt.relativenumber
      --   number = true, -- sets vim.opt.number
      --   spell = false, -- sets vim.opt.spell
      --   signcolumn = "yes", -- sets vim.opt.signcolumn to yes
      --   wrap = false, -- sets vim.opt.wrap
      -- },
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = true, -- sets vim.opt.wrap

        ignorecase = true, -- sets vim.opt.ignorecase
        smartcase = true, -- sets vim.opt.smartcase
        incsearch = true, -- sets vim.opt.incsearch
        wildignorecase = true, -- sets vim.opt.wildignorecase

        -- foldcolumn = "0",

        -- showtabline = 1,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        mapleader = " ", -- sets vim.g.mapleader
        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
        -- custom option
        material_theme_style = "darker",
        tcomment_mapleader1 = "<C-\\>",

        conflict_marker_highlight_group = "",
        conflict_marker_begin = "^<<<<<<< .*$",
        conflict_marker_end = "^>>>>>>> .*$",

        blamer_enabled = 1,
        blamer_delay = 200,
        blamer_prefix = "      ",
        blamer_template = "<committer-time> - <author> : <summary> : <commit-short>",
        blamer_date_format = "%y-%m/%d",
        blamer_show_in_visual_modes = 0,
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      i = {
        -- ["<C-H>"] = {
        --   function()
        --     return vim.fn['copilot#Accept']("\n")
        --   end,
        --   desc = "Copilot accept suggestion",
        --   expr = true,
        --   silent = true,
        --   script = true,
        --   replace_keycodes = false,
        -- },
      },
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        -- ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        -- ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

        -- custom option
        ["<leader>s"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
        ["<leader>w"] = { ":bw<CR>" },
        ["<leader>q"] = { ":q<CR>" },
        ["<leader>-"] = { ":sp<CR>" },
        ["<leader>z"] = { ":vs<CR>" },
        ["<leader><leader>d"] = { "<C-w>h" },
        ["<leader><leader>n"] = { "<C-w>l" },
        ["<leader><leader>h"] = { "<C-w>j" },
        ["<leader><leader>t"] = { "<C-w>k" },
        -- ["<leader>h"] = { "<Cmd>BufferPrevious<CR>" },
        -- ["<leader>t"] = { "<Cmd>BufferNext<CR>" },
        ["<leader>t"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<leader>h"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<leader>n"] = { "" },
        ["<leader>aa"] = { "<Cmd>AvanteAsk<CR>" },
        ["<leader>ae"] = { "<Cmd>AvanteEdit<CR>" },
        ["<leader>at"] = { "<Cmd>AvanteToggle<CR>" },
        ["e"] = { "a" },
        ["a"] = { "d" },
        ["aa"] = { "dd" },
        ["d"] = { "h" },
        ["h"] = { "gj" },
        ["t"] = { "gk" },
        ["n"] = { "l" },
        ["r"] = { "n" },
        ["R"] = { "N" },
        ["c"] = { "r" },
        ["C"] = { "R" },
        [";"] = { ":" },
        [":"] = { ";" },
        ["<ESC><ESC>"] = { ":nohl<CR>" },
        ["F"] = { "<Cmd>Lspsaga show_line_diagnostics<CR>" },
        ["K"] = { "<Cmd>Lspsaga hover_doc<CR>" },
        ["gt"] = { "<Cmd>Lspsaga goto_definition<CR>" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
      v = {
        ["d"] = { "h" },
        ["h"] = { "gj" },
        ["t"] = { "gk" },
        ["n"] = { "l" },
        ["a"] = { "d" },
        ["aa"] = { "dd" },
        ["r"] = { "n" },
        ["R"] = { "N" },
        ["c"] = { "r" },
        ["C"] = { "R" },
        [";"] = { ":" },
        [":"] = { ";" },
        ["<leader>ae"] = { "<Cmd>AvanteEdit<CR>" },
      },
    },
  },
}
