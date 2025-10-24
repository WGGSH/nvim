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
require('lspconfig').volar.setup({
  init_options = {
    typescript = {
      tsdk = vim.fn.expand(
        '~/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib'
      )
    }
  }
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

-- astrocore.lua に書くとうまく動かなかったので移動
vim.schedule(function()
  vim.keymap.set('n', '<Leader>h', function() require('astrocore.buffer').nav(-vim.v.count1) end, { desc = "Previous buffer" })
  vim.keymap.set('n', '<Leader>t', function() require('astrocore.buffer').nav(vim.v.count1) end, { desc = "Next buffer" })
end)
