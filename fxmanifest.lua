fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'ug-core'
description 'FiveM Framework by UgDev'
author 'UgDev'
version '3.5'
url 'https://github.com/UgDevOfc/ug-core'
ui_page 'html/index.html'

shared_scripts {
    'version.lua',
    'languages.lua',
    'languages/*.lua',
    'shared/*.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua',
    'client/functions.lua',
    'client/menus.lua',
    'client/events.lua',
    'client/callbacks.lua',
    'client/threads.lua',
    'client/exports.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/version.lua',
    'server/callbacks.lua',
    'server/functions.lua',
    'server/player.lua',
    'server/events.lua',
    'server/commands.lua',
    'server/threads.lua',
    'server/onesync.lua',
    'server/exports.lua',
}

files {
    'html/index.html',
    'html/css/*.css',
    'html/js/*.js'
}

dependencies {
    'oxmysql',
    'spawnmanager'
}