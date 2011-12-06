#!/usr/bin/env coffee
path = require 'path'
fs = require 'fs'
commando = {}
commandPath = path.join __dirname, '../commands/'
# Parse process args to command name and command arguments
parse = ->
  args = process.argv[2...]
  command = args[0]
  args.shift()
  if commandExists command
    require(commandPath + command).exe commando, args
  else
    defaultHelp commandPath, args
      
defaultHelp = (commandPath, args) ->
  if commandExists 'help'
    require(commandPath + 'help').exe(commando, args)
  else
    files = fs.readdirSync commandPath
    return console.log 'No commands found.' unless files
    commands = (path.basename(x, path.extname(x)) for x in files)
    console.log 'Available Commands:'
    console.log('  - ' + command) for command in commands
      
commandExists = (command) -> 
  try
    require.resolve path.join commandPath, command
    return true
  catch err
    return false
    
parse()
