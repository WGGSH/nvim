-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

-- copilot map
vim.cmd 'imap <silent><script><expr> <C-H> copilot#Accept("\\<CR>")'

-- perl のインデント幅
vim.cmd "augroup MyFileTypeEvent"
vim.cmd "autocmd!"
vim.cmd "autocmd FileType perl setlocal tabstop=4 softtabstop=4 shiftwidth=4"
vim.cmd "augroup END"

-- underline
-- colorscheme = "catppuccin"
-- vim.cmd("autocmd colorscheme " .. colorscheme .. " highlight CursorLine gui=underline guibg=none guisp=none")
-- vim.cmd("colorscheme " .. colorscheme)

-- underline
colorscheme = "monokai-pro"
vim.cmd("autocmd colorscheme " .. colorscheme .. " highlight CursorLine gui=underline guibg=none guisp=none guifg=none")
vim.cmd("colorscheme " .. colorscheme)

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'perl',
  callback = function()
    vim.opt_local.iskeyword:remove(':')
    vim.opt_local.iskeyword:remove('#')
  end
})

-- FIXME: 後で plugins 以下に移動したい
local lspconfig = require('lspconfig')
local mason_registry = require('mason-registry')

-- Vue Language Serverのパスを取得
local vue_ls_path = mason_registry.get_package('vue-language-server'):get_install_path()
local vue_typescript_plugin_path = vue_ls_path .. '/node_modules/@vue/language-server'

-- ts_lsの設定
lspconfig.ts_ls.setup({
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_typescript_plugin_path,
        languages = {'vue'}
      }
    }
  },
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue'},
})
