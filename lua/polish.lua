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
vim.cmd('imap <silent><script><expr> <C-H> copilot#Accept("\\<CR>")')

-- perl のインデント幅
vim.cmd('augroup MyFileTypeEvent')
vim.cmd('autocmd!')
vim.cmd('autocmd FileType perl setlocal tabstop=4 softtabstop=4 shiftwidth=4')
vim.cmd('augroup END')

-- underline
colorscheme = "catppuccin"
vim.cmd('autocmd colorscheme ' .. colorscheme .. ' highlight CursorLine gui=underline guibg=none guisp=none')
vim.cmd('colorscheme ' .. colorscheme)
