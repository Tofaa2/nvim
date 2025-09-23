--OPTIONS --
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- PLUGINS (USES NIGHTLY FOR NATIVE PACKAGE MANAGER) --
vim.pack.add({
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/nvim-mini/mini.pairs" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
    { src = "https://github.com/saghen/blink.cmp" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/morhetz/gruvbox" },
    { src = "https://github.com/rebelot/kanagawa.nvim" },
    { src = "https://github.com/rose-pine/neovim" },
    { src = "https://github.com/nvim-lua/plenary.nvim"},
    { src = "https://github.com/folke/todo-comments.nvim"},
    { src = "https://github.com/nvim-telescope/telescope.nvim"},
})

require("mini.pairs").setup()
require("mason").setup()
require("telescope").setup()
require("todo-comments").setup()
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "zig", "odin", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    sync_install = false,
    auto_install = true,
    ignore_install = { "javascript" },
    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },
}

-- LSP --
vim.lsp.enable({
    "lua_ls",
    "zls",
    "ols",

})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },

})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})
vim.cmd("set completeopt+=noselect")


-- COLORSCHEME --

vim.cmd("colorscheme rose-pine-moon")
vim.cmd(":hi statusline guibg=NONE")

-- KEYMAPS --

vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p<CR>')

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set("n", "<leader>tih", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }))
end, { desc = "Toggle LSP Inlay Hints" })

-- CUSTOM COMMANDS --

vim.api.nvim_create_user_command("Format", function()
    vim.lsp.buf.format({})
end
, {})
