fx_version 'cerulean'
game 'gta5'

shared_script "config.lua"
shared_script "@qb-core/shared/locale.lua"
shared_script "locales/en.lua"

client_scripts {
    "client/cl_*.lua"
}

server_scripts {
    "server/sv_*.lua"
}