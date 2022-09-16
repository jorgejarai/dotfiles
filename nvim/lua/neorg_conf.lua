require('neorg').setup {
    load = {
        ['core.defaults'] = {},
        ['core.norg.dirman'] = {
            config = {
                workspaces = {
                    personal = '~/Documents/norg/personal',
                    udec = '~/Documents/norg/udec'
                }
            }
        },
        ['core.norg.journal'] = {config = {workspace = 'personal'}},
        ['core.norg.manoeuvre'] = {},
        ['core.keybinds'] = {config = {default_keybinds = false}},
        ['core.export'] = {},
        ['core.export.markdown'] = {config = {extensions = 'all'}}
    }
}
