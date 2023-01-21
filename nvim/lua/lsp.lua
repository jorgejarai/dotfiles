local lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local opts = {noremap = true, silent = true}

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = {noremap = true, silent = true, buffer = bufnr}

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
end

local servers = {
    "bashls", "cssls", "cmake", "html", "pyright", "rust_analyzer",
    "tailwindcss", "jsonls", "texlab", "sumneko_lua", "emmet_ls",
    "bashls", "prismals", "phpactor", "csharp_ls"
}

local enhance_server_opts = {
    ["jsonls"] = function(opts)
        opts.commands = {
            Format = {
                function()
                    vim.lsp.buf.range_formatting({}, {0, 0},
                                                 {vim.fn.line('$'), 0})
                end
            }
        }
        opts.settings = {
            json = {
                schemas = require('schemastore').json.schemas(),
                validate = {enable = true}
            }
        }
    end,
    ["texlab"] = function(opts)
        opts.settings = {
            auxDirectory = 'build',
            build = {
                args = {
                    '-pdf', '-interaction=nonstopmode', "-shell-escape",
                    "-synctex=1", '-outdir=build', "%f"
                },
                executable = 'latexmk',
                forwardSearchAfter = false,
                isContinuous = true,
                onSave = true
            },
            chktex = {onEdit = true, onOpenAndSave = true},
            latexindent = {["local"] = "~/Proyectos/dotfiles/latexindent.yml"},
            forwardSearch = {executable = 'zathura', args = {'%p'}}
        }
    end,
    ["sumneko_lua"] = function(opts)
        local lua_runtime_path = vim.split(package.path, ';')
        table.insert(lua_runtime_path, 'lua/?.lua')
        table.insert(lua_runtime_path, 'lua/?/init.lua')

        opts.settings = {
            Lua = {
                runtime = {version = 'LuaJIT', path = lua_runtime_path},
                diagnostics = {globals = {'vim'}},
                workspace = {
                    library = {
                        library = vim.api.nvim_get_runtime_file('', true)
                    }
                }
            }
        }
    end,
    ["emmet_ls"] = function(opts)
        opts.filetypes = {"html", "css", "typescriptreact", "javascriptreact"}
    end
}

for _, name in pairs(servers) do
    local opts = {}

    opts.on_attach = on_attach
    opts.capabilities = capabilities

    if enhance_server_opts[name] then enhance_server_opts[name](opts) end

    lsp[name].setup(opts)
end

require("clangd_extensions").setup({
    server = {
        cmd = {'clangd', '--background-index', '--clang-tidy'},
        capabilities = {offsetEncoding = 'utf-8'}
    }
})

require('mason').setup()
require('mason-lspconfig').setup({ensure_installed = servers})

require("typescript").setup({
    server = {
	on_attach = on_attach,
	capabilities = capabilities
    }
})
