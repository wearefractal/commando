fs = require 'fs'
path = require 'path'
exec = require('child_process').exec
log = require 'node-log'
async = require 'async'

cloneDirectory = (dir, newdir, cb) ->
    clone = (file, call) ->
      oldf = path.join dir, file
      newf = path.join newdir, file
      fs.stat oldf, (err, stat) ->
        if stat.isDirectory()
          cloneDirectory oldf, newf, call
        else
          fs.readFile oldf, (err, data) ->
            fs.writeFile newf, data, (err) ->
              call()

    copyAll = (call) -> 
      fs.readdir dir, (err, files) -> 
        async.forEach files, clone, call
        
    path.exists newdir, (exists) ->
      if exists
        copyAll cb
      else
        fs.mkdir newdir, 0755, (err) -> copyAll cb
          
exports.exe = (cmd, args) -> 
  appName = args[0]
  unless appName 
    log.error "Missing appName parameter"
  else
    log.info "Creating #{ appName }..."
    appPath = path.join process.cwd(), appName
    template = path.join __dirname, '../template'
    commandoBin = path.join __dirname, '../bin'
    appBin = path.join appPath, path.basename(commandoBin)
    console.log appBin
    exists = path.existsSync appPath
    if exists
      return log.error "#{ appPath } already exists"
    else
      cloneDirectory template, appPath, ->
        cloneDirectory commandoBin, appBin, ->
          log.info "Creation of #{ appName } completed"

