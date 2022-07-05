local cmp = require'cmp'
cmp.setup {
    completion = {
        autocomplete = false
    },
    snippet = {
        expand = function(args) end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-N>'] = cmp.mapping { i = cmp.mapping.complete() },
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
    }),
    sources = {
        { name = 'nvim_lsp' },
    },
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities())

require('lspconfig').clangd.setup {
    capabilities = capabilities
}
vim.diagnostic.disable()

require('telescope').setup {
    defaults = {
        layout_config = {
            vertical = { width = 80, height = 0.4, preview_height = 10 }
        },
        layout_strategy = 'vertical',
        file_ignore_patterns = {
            "build",
            "bin",
            ".vs",
            ".cache",
            ".git",
            "compile_commands.json",
        }
    }
}
