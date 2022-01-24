local lsp = require 'lspconfig'
local configs = require 'lspconfig/configs'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = {
        noremap = true,
        silent = true
    }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',
                                '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',
                                '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',
                                '<cmd>lua vim.lsp.buf.implementation()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',
                                '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',
                                '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca',
                                '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D',
                                '<cmd>lua vim.lsp.buf.type_definition()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e',
                                '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q',
                                '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn',
                                '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls',
                                "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d',
                                '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d',
                                '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
                                opts)
end

local language_servers = {
    'bashls', 'cssls', 'cmake', 'html', 'pyright', 'rust_analyzer',
    'tailwindcss', 'tsserver'
}

for _, server in ipairs(language_servers) do
    lsp[server].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

lsp.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {'clangd', '--background-index', '--clang-tidy'}
}

lsp.jsonls.setup {
    capabilities = capabilities,
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line('$'), 0})
            end
        }
    }
}

lsp.texlab.setup {
    settings = {
        texlab = {
            build = {
                args = {'%f', '--synctex', '--keep-logs', '-Zshell-escape'},
                executable = 'tectonic',
                onSave = true
            },
            chktex = {
                onEdit = true,
                onOpenAndSave = true
            }
        }
    }
}

local lua_runtime_path = vim.split(package.path, ';')
table.insert(lua_runtime_path, "lua/?.lua")
table.insert(lua_runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = lua_runtime_path
            },
            diagnostics = {
                globals = {'vim'}
            },
            workspace = {
                library = {
                    library = vim.api.nvim_get_runtime_file("", true)
                }
            }
        }
    }
}
