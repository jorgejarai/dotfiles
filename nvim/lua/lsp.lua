local lsp = require 'lspconfig'
local lsp_installer = require 'nvim-lsp-installer'

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
    "tailwindcss", "tsserver", "clangd", "jsonls", "texlab", "sumneko_lua",
    "emmetls", "bashls"
}

for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)

    if server_is_found and not server:is_installed() then
        print("Installing " .. name)
        server:install()
    end
end

local enhance_server_opts = {
    ["clangd"] = function(opts)
        opts.cmd = {'clangd', '--background-index', '--clang-tidy'}
    end,
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
            build = {
                args = {
                    '-pvc', '-pdf', '-interaction=nonstopmode', "-shell-escape",
                    "-synctex=1", "%f"
                },
                executable = 'latexmk',
                forwardSearchAfter = false,
                isContinuous = true
            },
            chktex = {onEdit = true, onOpenAndSave = true},
            latexindent = {["local"] = "~/Proyectos/dotfiles/latexindent.yml"}
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
    ["emmetls"] = function(opts)
        opts.filetypes = {"html", "css", "typescriptreact", "javascriptreact"}
    end
}

lsp_installer.on_server_ready(function(server)
    local opts = {}

    opts.on_attach = on_attach
    opts.capabilities = capabilities

    if enhance_server_opts[server.name] then
        enhance_server_opts[server.name](opts)
    end

    server:setup(opts)
end)
