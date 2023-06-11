local command = vim.cmd
command([[set shiftwidth=2 smarttab]])
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})
command([[set number]])
command([[set relativenumber]])
--setup flutter tool
require("flutter-tools").setup {} -- use defaults
