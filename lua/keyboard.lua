local bind = vim.keymap.set
vim.g.mapleader = " "
bind("n", "<leader>pv", vim.cmd.Ex)
--telescope 
bind("n", "<leader>tf", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
bind("n", "<leader>ts", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
bind("n", "<leader>tc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
bind("n", "<leader>tb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
bind("n", "<leader>th", "<cmd>Telescope help_tags<cr>") -- list available help tags
-- telescope git commands
bind("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
bind("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
bind("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
bind("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
--flutter shortcut
bind("n", "<leader>ff", "<cmd>FlutterRun<cr>")
bind("n", "<leader>fr", "<cmd>FlutterReload<cr>")
bind("n", "<leader>fR", "<cmd>FlutterRestart<cr>")
bind("n", "<leader>fq", "<cmd>FlutterQuit<cr>")
bind("n", "<leader>fd", "<cmd>FlutterDevices<cr>")

--some optional binding
bind({"n","v"}, "<leader>ca", vim.lsp.buf.code_action)
bind("n", "<C-f>", ":lua vim.lsp.buf.format({ async = true})<cr>", { silent = true })
bind("n", "<leader>e", "<cmd>TroubleToggle document_diagnostics<cr>")
bind("n", "<leader>bd", "<cmd>bd<cr>") --buffer delete
bind("n", "<leader>bn", "<cmd>bn<cr>") --next buffer
bind("n", "<leader>bp", "<cmd>bp<cr>") --buffer previous
bind("n", "<leader>h", "<C-w>w<cr>")
-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Configure autocompletion menu
vim.o.pumheight = 10

-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})

-- Configure LSP servers
local lspconfig = require'lspconfig'

-- Configure completion plugin
local cmp = require'cmp'

cmp.setup({
    mapping = {
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<C-Space>"] = cmp.mapping.complete(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
        { name = 'buffer' },
        { name = 'path' },
    },
})

--prefix name setting
local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

wk.register({
  f = {
    name = "Flutter",
  },
  t = {
    name = "Telescope"
  },
  e = {
    name = "Document_Diagnostics"
  },
  b = {
    name = "Buffers",
    d = {
      name = "Buffer Delete"
    },
    n = {
      name = "Buffer Next"
    },
    p = {
      name = "Buffer previous"
    }
  },
  g = {
    name = "Git",
    f = {
      name = "git_bcommits"
    }
  },
  c = {
    name = "Lsp",
    a = {
      name = "Lsp_Action_menu"
    }
  },
  p = {
    name = "Files",
    v = {
      name = "FileManager Ex"
    },
  }
}, { prefix = "<leader>" })
