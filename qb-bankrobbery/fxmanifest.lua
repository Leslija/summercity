fx_version 'cerulean'

game 'gta5'
lua54 'yes'


client_scripts {
    '@mka-lasers/client/client.lua',
    'client/cl_main.lua',
    'client/cl_target.lua',
    'client/cl_laptops.lua',
    'client/cl_doors.lua',
    'client/cl_fleeca.lua',
    'client/cl_paleto.lua',
    'client/cl_pacific.lua',
    'client/cl_vault.lua'
}

shared_script {
    'shared/sh_config.lua'
}

server_scripts {
    'server/sv_main.lua',
    'server/sv_laptops.lua',
    'server/sv_vault.lua'
}
