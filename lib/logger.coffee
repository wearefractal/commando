require 'colors'
pack = require('./package').load()

appColor = CMD.config.appColor

module.exports =

  log: (str) ->
    console.log str

  debug: (str) ->
    console.log '[' + pack.name.green, '-', 'DEBUG'.upcase().green.inverse + ']', str

  info: (str) ->
    console.log '[' + pack.name.green, '-', 'info'.white + ']', str

  warn: (str) ->
    console.log '[' + pack.name.green, '-', 'warn'.upcase().yellow + ']', str

  error: (str) ->
    console.log '[' + pack.name.green, '-', 'error'.red.inverse + ']', str

