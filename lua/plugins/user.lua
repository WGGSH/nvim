-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

local monokai_pro_pallete;

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  {
    "EdenEast/nightfox.nvim",
    config = function() require("nightfox").setup {} end,
  },

  {
    "kaicataldo/material.vim",
  },

  {
    "https://github.com/ntpeters/vim-better-whitespace",
    lazy = false,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },

  {
    "github/copilot.vim",
    lazy = false,
  },

  {
    "https://github.com/tomtom/tcomment_vim",
    lazy = false,
  },

  {
    "rhysd/conflict-marker.vim",
    lazy = false,
  },

  {
    "APZelos/blamer.nvim",
    lazy = false,
  },

  {
    "stevearc/aerial.nvim",
    lazy = false,
    config = function()
      require("aerial").setup({
        show_guides = true,
        keymaps = {
          ["h"] = false
        },
        filter_kind = {
          -- "Class",
          "Constructor",
          "Enum",
          "Function",
          "Interface",
          "Method",
          "Module",
          "Struct",
          "Type",
          "Field",
          "Component",
          "Variable",
        },
        backends = {
          ["_"] = { "treesitter", "lsp" },
          vue = { "treesitter", "lsp" },
        },
        show_symbol_details = true;
        -- icons = {
        --   group = {
        --     ["class"] = " ",
        --     ["function"] = " ",
        --     ["method"] = " ",
        --     ["variable"] = " ",
        --   },
        -- },
      })
    end
  },

  {
    "thinca/vim-partedit",
    lazy = false,
  },

  {
    "nordtheme/vim",
    lazy = false,
  },

  {
    "NLKNguyen/papercolor-theme",
    lazy = false,
  },

  {
    "sainnhe/sonokai",
    lazy = false,
  },

  {
    "Frederick888/vim-prettier",
    branch = "prettier-3-0",
    lazy = false,
  },

  {
    "Mofiqul/vscode.nvim",
    lazy = false,
  },

  {
    "oxfist/night-owl.nvim",
    lazy = false,
  },

  {
    "JoosepAlviste/palenightfall.nvim",
    lazy = false,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
  },

  {
    "romgrk/barbar.nvim",
    config = function()
      require("barbar").setup {
        maximum_padding = 1,
        maximum_length = 5,
        icons = {
          buffer_index = true,
          gitsigns = {
            added = { enabled = true, icon = "+" },
            changed = { enabled = true, icon = "~" },
            deleted = { enabled = true, icon = "-" },
          },
          diagnostics = {
            [vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
            [vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
            [vim.diagnostic.severity.INFO] = { enabled = true },
            [vim.diagnostic.severity.HINT] = { enabled = true },
          },
          -- preset = 'powerline',
          -- separator = { left = '', right = '' },
          separator_at_end = false,
        },
      }
    end,
    lazy = false,
  },

  -- {
  --   "akinsho/bufferline.nvim",
  --   config =function()
  --     require('bufferline').setup({
  --       highlights = require("catppuccin.groups.integrations.bufferline").get({
  --         styles = { 'regurar', 'bold' },
  --         custom = {
  --           all = {
  --             -- fill = { bg = 'blue'},
  --           }
  --         }
  --       }),
  --       options = {
  --         numbers = "ordinal",
  --         indicator = {
  --           style = 'underline',
  --         },
  --         diagnostics = "nvim_lsp",
  --         separator_style = 'slant',
  --       },
  --     })
  --   end,
  --   -- after = "catppuccin",
  --   lazy = false,
  -- },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
          hover = {
            enabled = false,
          },
          signature = {
            enabled = false,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        cmdline = {
          format = {
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
          },
        },
        views = {
          notify = {
            backend = "notify",
            merge = true,
            replace = true,
          },
        },
      }
    end,
  },

  {
    "SmiteshP/nvim-navic",
    lazy = false,
  },

  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  -- {
  --   "rebelot/heirline.nvim",
  --   opts = function(_, opts)
  --     local status = require "astronvim.utils.status"
  --     return {
  --       opts = {
  --         disable_winbar_cb = function(args)
  --           return not require("astronvim.utils.buffer").is_valid(args.buf)
  --             or status.condition.buffer_matches({
  --               buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
  --               filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
  --             }, args.buf)
  --         end,
  --       },
  --       statusline = { -- statusline
  --         hl = { fg = "fg", bg = "bg" },
  --         status.component.mode(),
  --         status.component.git_branch(),
  --         status.component.file_info { filetype = {}, filename = false, file_modified = false },
  --         status.component.git_diff(),
  --         status.component.diagnostics(),
  --         status.component.fill(),
  --         status.component.cmd_info(),
  --         status.component.fill(),
  --         status.component.lsp(),
  --         status.component.treesitter(),
  --         status.component.nav(),
  --         status.component.mode { surround = { separator = "right" } },
  --       },
  --     }
  --   end,
  -- },

  {
    "nvimdev/lspsaga.nvim",
    lazy = false,
    config = function()
      require("lspsaga").setup {
        symbol_in_winbar = {
          enable = true,
        },
        finder = {
          max_height = 0.6,
          default = "tyd+ref+imp+def",
          keys = {
            toggle_or_open = "<CR>",
            vsplit = "v",
            split = "s",
            tabnew = "t",
            tab = "T",
            quit = "q",
            close = "<Esc>",
          },
          methods = {
            tyd = "textDocument/typeDefinition",
          },
        },
        ui = {
          code_action = "",
        },
        show_outline = {
          auto_preview = true,
        },
        outline = {
          win_position = "left",
          layout = "float",
          max_height = 0.4,
        },
      }
    end,
  },

  {
    "ibhagwan/fzf-lua",
    lazy = false,
  },

  {
    "projekt0n/github-nvim-theme",
    lazy = false,
  },

  {
    "catppuccin/nvim",
    lazy = false,
    config = function()
      require("catppuccin").setup {
        flavour = "macchiato",
        transparent_background = true,
        integrations = {
          barbar = false,
          illuminate = {
            enabled = true,
            lsp = false,
          },
        },
        color_overrides = {
          macchiato = {
            base = "#222426",
            red = "#E95678",
            -- green = "#A6E22E",
            yellow = "#E6DB74",
            -- blue = "#66D9EF",
            purple = "#AE81FF",
            cyan = "#A1EFE4",
            white = "#F8F8F2",
          },
        },
      }
    end,
  },

  {
    "RRethy/vim-illuminate",
    lazy = false,
  },

  {
    "equalsraf/neovim-gui-shim",
    lazy = false,
  },

  -- {
  --   "ldelossa/nvim-ide",
  --   lazy = true,
  --   -- event = "BufRead",
  --   config = function()
  --     local explorer = require("ide.components.explorer")
  --
  --     require('ide').setup({
  --       icon_set = 'nerd',
  --       panels = {},
  --       panel_groups = {
  --         explorer = {
  --           explorer.Name,
  --         },
  --         terminal = {},
  --         git = {},
  --       },
  --       workspaces = {},
  --     })
  --   end
  -- }

  -- {
  --   "vim-airline/vim-airline",
  --   config = function()
  --     vim.g.airline_theme = "catppuccin"
  --     vim.g.airline_left_sep = ''
  --     vim.g.airline_right_sep = ''
  --     vim.g.airline_left_alt_sep = ''
  --     vim.g.airline_right_alt_sep = ''
  --     vim.g.airline_symbols.branch = ''
  --
  --   end,
  --   lazy = false,
  -- }

  {
    "tpope/vim-dispatch",
    lazy = false,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "python", "codelldb" },
    },
  },

  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    config = function()
      require("monokai-pro").setup {
        transparent_background = true,
        terminal_colors = true,
        devicons = true, -- highlight the icons of `nvim-web-devicons`
        styles = {
          comment = { italic = true },
          keyword = { italic = true }, -- any other keyword
          type = { italic = true }, -- (preferred) int, long, char, etc
          storageclass = { italic = true }, -- static, register, volatile, etc
          structure = { italic = true }, -- struct, union, enum, etc
          parameter = { italic = true }, -- parameter pass in function
          annotation = { italic = true },
          tag_attribute = { italic = true }, -- attribute of tag in reactjs
        },
        filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
        -- Enable this will disable filter option
        day_night = {
          enable = false, -- turn off by default
          day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
          night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
        },
        inc_search = "background", -- underline | background
        background_clear = {
          "float_win",
          "toggleterm",
          "telescope",
          "which-key",
          "renamer",
          "notify",
          "nvim-tree",
          "neo-tree",
          "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
        }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
        plugins = {
          bufferline = {
            underline_selected = false,
            underline_visible = false,
          },
          indent_blankline = {
            context_highlight = "pro", -- default | pro
            context_start_underline = true,
          },
        },
        override = function(c)
          monokai_pro_pallete = c.base
          return {
          }
        end,
        overridePalette = function(filter) return {} end,
      }
    end,
  },

  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require("notify").setup({
        stages = "slide",
        timeout = 1500,
        level = 1,
        background_colour = "NotifyWarnIcon",
        -- background_colour = "#000000",
        -- icons = {
        --   ERROR = "",
        --   WARN = "",
        --   INFO = "",
        --   DEBUG = "",
        --   TRACE = "✎"
        -- },
        top_down = false, -- これを false にすると右下になります。
      })
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    -- branch = "canary",
    dependencies = {
      -- { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "github/copilot.vim" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
      window = {
        layout = "float",
        border = "rounded",
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },

  {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function() require("neoscroll").setup {} end,
  },

  {
    "shellRaining/hlchunk.nvim",
    lazy = false,
    config = function()
      require("hlchunk").setup {
        chunk = {
          enable = true,
          use_treesitter = true,

          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "┌",
            left_bottom = "└",
            right_arrow = "→",
          },
          -- style = "#00ffff",
          -- style = monokai_pro_pallete.dimmed1,
          duration = 0,
          delay = 0,
        },
        indent = {
          enable = true,
          use_treesitter = true,
        },
        line_num = {
          enable = true,
          use_treesitter = true,
        },
      }
    end,
  },

  {
    "dstein64/nvim-scrollview",
    config = function()
      require("scrollview").setup {
        excluded_filetypes = { "neo-tree" },
      }
    end,
    lazy = false,
  },

  {
    "famiu/bufdelete.nvim",
    lazy = false,
  },

  {
    "sainnhe/everforest",
    lazy = false,
  },
}
