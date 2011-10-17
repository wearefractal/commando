##
## $ commander create "appName"
##

fs = require 'fs'
path = require 'path'
exec = require('child_process').exec

exports.exe = (CMD, args) -> 

  ## map args ## CHANGE
  [appName] = args
  appPath = './' + appName

  ## create app dir 

  CMD.log "Creating app '#{appName}'...".green
  
  path.exists appPath, (exists) ->
   
    if exists?
      CMD.log "Error: dir '#{appName} already exists".red
    else
      exec "cp -R #{CMD.paths.lib}template/ #{appPath}", (error, stdout, stderr) ->
        if error?
          CMD.log error 
        else
          CMD.log "'#{appName}' created".green

