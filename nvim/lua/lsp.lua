vim.lsp.enable({
  "bashls",
  "gopls",
  "lua_ls",
  "ts_ls",
  "rust-analyzer",
  "helm_ls",
})
vim.diagnostic.config({ signs = true })

local function goto_diagnostic(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  go({ severity = severity })
  vim.defer_fn(function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      border = "rounded",
      scope = "cursor",
    })
  end, 50) -- slight delay to let the cursor settle
end

-- Map ]d and [d to jump and show popup
vim.keymap.set("n", "]d", function() goto_diagnostic(true) end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", function() goto_diagnostic(false) end, { desc = "Previous diagnostic" })

-- (Optional) error-only versions:
vim.keymap.set("n", "]e", function() goto_diagnostic(true, vim.diagnostic.severity.ERROR) end,
  { desc = "Next error" })
vim.keymap.set("n", "[e", function() goto_diagnostic(false, vim.diagnostic.severity.ERROR) end,
  { desc = "Previous error" })
