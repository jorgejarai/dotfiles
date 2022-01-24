-- Config: Shortcut for editing Lua config files
function _G.edit_config(cmd)
    if cmd == 'init' then
        cmd = 'e ~/.config/nvim/init.lua'
    else
        cmd = string.format('e ~/.config/nvim/lua/%s.lua', cmd)
    end

    vim.api.nvim_command(cmd)
end

vim.cmd('command! -nargs=* C lua edit_config(<f-args>)')
vim.cmd('command! -nargs=* P lua edit_config("plugins")')
