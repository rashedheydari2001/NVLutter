local bind = vim.keymap.set
vim.g.mapleader = " "
bind("n", "<leader>pv", vim.cmd.Ex)
--telescope 
bind("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
bind("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
bind("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
bind("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
bind("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
-- telescope git commands
bind("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
bind("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
bind("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
bind("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
bind("n", "<leader>ca", "<cmd>CodeActionMenu<cr>") --open up CodeActionMenu
bind("n", "<C-f>", ":lua vim.lsp.buf.format({ async = true})<cr>", { silent = true })
bind("n", "<leader>d", "<cmd>TroubleToggle document_diagnostics<cr>")
bind("n", "<leader>bn", "<cmd>bn<cr>") --next buffer
bind("n", "<leader>bd", "<cmd>bd<cr>") --buffer delete
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
