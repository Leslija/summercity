fx_version 'cerulean'

game 'gta5'
lua54 'yes'

dependencies {
    'memorygame'
} 

client_scripts {
    'client/cl_*.lua',
}

shared_script {
    'shared/sh_*.lua',
}

server_scripts {
    'server/sv_*.lua',
}