# AGENTS.md - Neovim Config Guidelines

## Overview
This is a Neovim configuration written in Lua using the native `vim.pack` plugin manager.

## Code Style & Conventions

### Lua Style
- **Indentation**: 4 spaces (defined in `configs.lua`)
- **Formatting**: Uses Prettier/prettierd via conform.nvim
- **Naming**: snake_case for variables/functions, CamelCase for module tables
- **Imports**: Use `require()` at module level; prefer local assignments for frequently used APIs
  ```lua
  local keymap = vim.keymap.set
  local autocmd = vim.api.nvim_create_autocmd
  ```
- **Comments**: Include descriptive comments inline (as seen in keymaps.lua)
- **Error handling**: Use `pcall()` for potentially failing operations (vim.loop.fs_stat example in plugins.lua)

### Structure
- **Entry point**: `init.lua` loads modules in order: plugins → configs → keymaps → autocmds → lsp
- **LSP setup**: Minimal—enable servers in `lsp.lua`, configure in `lsp/` directory per-server
- **Plugin setup**: Centralized in `plugins.lua`, use `require()` directly after plugin declaration
- **Keymaps**: Defined in `keymaps.lua`; use tables for options: `{ silent = true, desc = "..." }`

### Plugin Patterns
- Use `vim.pack.add()` for plugin management
- Formatters via conform.nvim (Prettier preferred via prettierd)
- LSP servers managed by Mason

## Build/Lint/Test

This is a configuration repository—no build, lint, or test commands. To verify changes:
- Restart Neovim or run `:source ~/.config/nvim/init.lua`
- Check for errors in `:messages`
- Test keymaps/LSP functionality manually

## Notes
- No tests or CI pipeline
- Manual verification required for changes
- Format Lua files with `conform.format()` (Leader+f)
