local lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = {noremap = true, silent = true}
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
                                '<cmd>lua vim.diagnostic.open_float(0, {scope="cursor"})<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q',
                                '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn',
                                '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls',
                                "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d',
                                '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d',
                                '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end

local servers = {
    "bashls", "cssls", "cmake", "html", "pyright", "rust_analyzer",
    "tailwindcss", "tsserver", "jsonls", "texlab", "sumneko_lua", "emmet_ls",
    "bashls", "prismals"
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
