#!/usr/bin/env coffee
path = require 'path'
fs = require 'fs'
commando = {}

# Parse process args to command name and command arguments
parse = ->
  args = process.argv[2...]
  command = args[0]
  args.shift()
  commandPath = path.join __dirname, '../commands/'
  if commandExists commandPath, command
    mainCommand = require commandPath + command
    if mainCommand?.hasOwnProperty 'exe'
      mainCommand.exe commando, args
    else
      defaultHelp commandPath, args
  else
    defaultHelp commandPath, args
      
defaultHelp = (commandPath, args) ->
  if commandExists(commandPath, 'help') and (helpCommand = require(commandPath + 'help')).hasOwnProperty 'exe'
    helpCommand.exe(commando, args)
  else
    files = fs.readdirSync commandPath
    if files
      commands = (path.basename(x, path.extname(x)) for x in files)
      console.log 'Available Commands:'
      console.log('  - ' + command) for command in commands
    else
      console.log 'No commands found.'
      
commandExists = (commandPath, command) -> 
  exists = path.existsSync path.join commandPath, command + '.js'
  exists or= path.existsSync path.join commandPath, command + '.coffee'
  return exists
    
parse()
