vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
    { src = "https://github.com/folke/tokyonight.nvim"},
    {
	src = "https://github.com/nvim-treesitter/nvim-treesitter",
	checkout = "master",
	build = ":TSUpdate",
	lazy = false,
    },
    { src = 'https://github.com/vieitesss/miniharp.nvim' },
    { src = "https://github.com/ibhagwan/fzf-lua" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/kdheepak/lazygit.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/mfussenegger/nvim-lint" },
})

require('gitsigns').setup({ signcolumn = false })


require("conform").setup({
  -- Use prettierd when available, fallback to prettier
  formatters_by_ft = {
    javascript = { "prettierd", "prettier" },
    javascriptreact = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier" },
    vue = { "prettierd", "prettier" },
    svelte = { "prettierd", "prettier" },
    css = { "prettierd", "prettier" },
    scss = { "prettierd", "prettier" },
    less = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    jsonc = { "prettierd", "prettier" },
    yaml = { "prettierd", "prettier" },
    markdown = { "prettierd", "prettier" },
    markdown_mdx = { "prettierd", "prettier" },
    graphql = { "prettierd", "prettier" },
    -- keep using your other formatters for other fts if you add them
  },
    format_on_save = function(bufnr)
    -- Disable for large files if you want:
    local max = 200 * 1024 -- 200 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
    if ok and stats and stats.size > max then return end
    return { timeout_ms = 3000, lsp_fallback = false }
  end,
})


require("mason").setup({})
require("mason-tool-installer").setup({
  ensure_installed = {
    "prettierd",  -- Prettier daemon (preferred)
    "prettier",   -- fallback if you don’t want the daemon
    "eslint_d",   -- optional: fast ESLint (for other tooling)
  },
  run_on_start = true,
})



require("blink.cmp").setup({
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
    keymap = {
        preset = "enter",
    },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        }
    },

    cmdline = {
        keymap = {
            preset = 'inherit',
            ['<CR>'] = { 'accept_and_enter', 'fallback' },
        },
    },

    sources = { default = { "lsp" } }
})


require('nvim-treesitter.configs').setup({
  highlight = { enable = true },
  ensure_installed = {
    "bash",
    "go",
    "lua",
    "typescript",
    "tsx",
    "javascript",
    "rust",
    "yaml",
  },
})

require('miniharp').setup({
  autoload = true, -- load marks for this cwd on startup (default: true)
  autosave = true, -- save marks for this cwd on exit (default: true)
  show_on_autoload = true, -- show popup list after a successful autoload (default: false)
})

local actions = require('fzf-lua.actions')
require('fzf-lua').setup({
    winopts = { backdrop = 85 },
    keymap = {
        builtin = {
            ["<C-f>"] = "preview-page-down",
            ["<C-b>"] = "preview-page-up",
            ["<C-p>"] = "toggle-preview",
        },
        fzf = {
            ["ctrl-a"] = "toggle-all",
            ["ctrl-t"] = "first",
            ["ctrl-g"] = "last",
            ["ctrl-d"] = "half-page-down",
            ["ctrl-u"] = "half-page-up",
        }
    },
    actions = {
        files = {
            ["ctrl-q"] = actions.file_sel_to_qf,
            ["ctrl-n"] = actions.toggle_ignore,
            ["ctrl-h"] = actions.toggle_hidden,
            ["enter"]  = actions.file_edit_or_qf,
        }
    }
})

local lint = require('lint')
lint.linters_by_ft = {
  javascript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  typescript = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
}
