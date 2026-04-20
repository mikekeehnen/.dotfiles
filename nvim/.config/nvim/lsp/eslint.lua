---@type vim.lsp.Config
return {
    cmd = { 'vscode-eslint-language-server', '--stdio' },
    filetypes = {
        'javascript',
        'javascriptreact',
        'javascript.jsx',
        'typescript',
        'typescriptreact',
        'typescript.tsx',
    },
    root_markers = { '.eslintrc.json', '.eslintrc.js', 'package.json', '.git' },
    init_options = {
        documentFormat = false,
        codeActionOnSave = false,
        experimental = { useFlatConfig = false },
    },
}

