-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

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

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            -- " █████  ███████ ████████ ██████   ██████ ",
            -- "██   ██ ██         ██    ██   ██ ██    ██",
            -- "███████ ███████    ██    ██████  ██    ██",
            -- "██   ██      ██    ██    ██   ██ ██    ██",
            -- "██   ██ ███████    ██    ██   ██  ██████ ",
            -- "",
            -- "███    ██ ██    ██ ██ ███    ███",
            -- "████   ██ ██    ██ ██ ████  ████",
            -- "██ ██  ██ ██    ██ ██ ██ ████ ██",
            -- "██  ██ ██  ██  ██  ██ ██  ██  ██",
            -- "██   ████   ████   ██ ██      ██",
          }, "\n"),
        },
      },
    },
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
    event = "FileType",
    config = function()
      vim.g.better_whitespace_filetypes_blacklist = { "help", "markdown", "text", "snacks_dashboard" }
      vim.g.strip_whitespace_on_save = 0
      vim.g.better_whitespace_guicolor = "#E95678"
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },

  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = { accept = "<C-h>" },
        },
      })
    end,
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

  -- {
  --   "stevearc/aerial.nvim",
  --   lazy = false,
  --   config = function()
  --     require("aerial").setup({
  --       show_guides = true,
  --       keymaps = {
  --         ["h"] = false
  --       },
  --       filter_kind = {
  --         -- "Class",
  --         "Constructor",
  --         "Enum",
  --         "Function",
  --         "Interface",
  --         "Method",
  --         "Module",
  --         "Struct",
  --         "Type",
  --         "Field",
  --         "Component",
  --         "Variable",
  --       },
  --       backends = {
  --         ["_"] = { "treesitter", "lsp" },
  --         vue = { "treesitter", "lsp" },
  --       },
  --       show_symbol_details = true;
  --       -- icons = {
  --       --   group = {
  --       --     ["class"] = " ",
  --       --     ["function"] = " ",
  --       --     ["method"] = " ",
  --       --     ["variable"] = " ",
  --       --   },
  --       -- },
  --     })
  --   end
  -- },

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

  -- v5 移行に伴い一旦削除
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
        stages = "fade_in_slide_out",
        timeout = 500,
        level = 1,
        background_colour = "#000000",
        -- icons = {
        --   ERROR = "",
        --   WARN = "",
        --   INFO = "",
        --   DEBUG = "",
        --   TRACE = "✎"
        -- },
        top_down = false, -- これを false にすると右下になります。
        render = "default",
      })
    end,
  },

  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   -- branch = "canary",
  --   dependencies = {
  --     { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
  --     -- { "github/copilot.vim" }, -- or github/copilot.vim
  --     { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  --   },
  --   build = "make tiktoken", -- Only on MacOS or Linux
  --   opts = {
  --     debug = true, -- Enable debugging
  --     -- See Configuration section for rest
  --     window = {
  --       layout = "float",
  --       border = "rounded",
  --     },
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  -- },

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

  {
    "ojroques/nvim-osc52",
    lazy = false,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = false,
    opts = {
      file_types = { "markdown", "Avante" },
    },
    ft = { "markdown", "Avante" },
  },

  {
    "yetone/avante.nvim",
    enabled = true,
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
      provider = "copilot",
      -- provider = "claude",
      -- provider = "openai",
      auto_suggestions_provider = "copilot",
      behaviour = {
        auto_suggestions = false, -- "copilot.lua", を使う
        auto_set_keymaps = false,
        auto_apply_diff_after_generation = true,
        support_paste_from_clipboard = true,
        enable_cursor_planning_mode = false,
      },
      windows = {
        position = "bottom",
        width = 30,
        sidebar_header = {
          align = "center",
          rounded = true,
        },
        ask = {
          floating = true,
          start_insert = true,
          border = "rounded"
        }
      },
      -- providers-setting
      claude = {
        model = "claude-3-5-sonnet-20240620", -- $3/$15, maxtokens=8000
        -- model = "claude-3-opus-20240229",  -- $15/$75
        -- model = "claude-3-haiku-20240307", -- $0.25/1.25
        max_tokens = 8000,
      },
      copilot = {
        -- model = "gpt-4o-2024-05-13",
        model = "gpt-4o-mini",
        -- model = "claude-3.5-sonnet",
        max_tokens = 4096,
      },
      openai = {
        model = "gpt-4o", -- $2.5/$10
        -- model = "gpt-4o-mini", -- $0.15/$0.60
        max_tokens = 4096,
      },
      -- mappings = {
      --   suggestion = {
      --     accept = "<C-h>",
      --   }
      -- },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons",
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "zbirenbaum/copilot.lua",  -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    file_selector = {
      provider = "fzf",
    },
  }
}
