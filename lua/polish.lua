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

-- perl のインデント幅
vim.cmd "augroup MyFileTypeEvent"
vim.cmd "autocmd!"
vim.cmd "autocmd FileType perl setlocal tabstop=4 softtabstop=4 shiftwidth=4"
vim.cmd "augroup END"

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


neoscroll = require('neoscroll')
local keymap = {
  ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 100 }) end;
  ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 100 }) end;
  ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 250 }) end;
  ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 250 }) end;
  ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor=false; duration = 50 }) end;
  ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor=false; duration = 50 }) end;
  ["zt"]    = function() neoscroll.zt({ half_win_duration = 100 }) end;
  ["zz"]    = function() neoscroll.zz({ half_win_duration = 100 }) end;
  ["zb"]    = function() neoscroll.zb({ half_win_duration = 100 }) end;
}
local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end

vim.keymap.set('n', '<leader>c', require('osc52').copy_operator, {expr = true})
vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
vim.keymap.set('v', '<leader>c', require('osc52').copy_visual)
