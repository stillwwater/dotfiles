local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local cmp = require('cmp')
cmp.setup {
    view = { entries = "wildmenu" },
    confirmation = { completeopt = 'menu,menuone,noinsert' },
    mapping = {
        ['<C-Space>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },

        ['<Tab>'] = function(fallback)
            if not cmp.select_next_item() then
                if vim.bo.buftype ~= 'prompt' and has_words_before() then
                    cmp.complete()
                    --cmp.confirm({ select = true })
                else
                    fallback()
                end
            end
        end,

        ['<S-Tab>'] = function(fallback)
            if not cmp.select_prev_item() then
                if vim.bo.buftype ~= 'prompt' and has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
    },
    snippet = {},
}
local capabilities = require('cmp_nvim_lsp').default_capabilities({ snippetSupport = false })

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
