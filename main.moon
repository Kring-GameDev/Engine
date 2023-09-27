import Event from require "libs.util.event"
Event.init!
for _, dir in pairs love.filesystem.getDirectoryItems( "mods" )
    for k, mod in pairs love.filesystem.getDirectoryItems( "mods/" .. dir )
        f = require("mods/" .. dir .. "/" .. (mod\sub(0, -6)))
        f("mods/" .. dir)
        