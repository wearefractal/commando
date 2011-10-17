##
## CMD
##

## requires

path = require 'path'
logger = require "node-log"

module.exports = CMD = 

  ##
  ## CONFIG
  ##

  config: require './config'

  ##
  ## PATHS
  ##

  paths: {}

  ##
  ## INFRA
  ##

  ## logging

  log: (msg) ->
	  logger.log msg

  error: (args) ->
	  logger.error args

  ##
  ## parse ->
  ##
  ## parses command line input and maps to cli commands
  ##

  parse: (dir) ->

	  @paths.root = path.normalize dir + '/../'
	  @paths.lib = @paths.root + 'lib/'
	  @paths.commands = @paths.root + 'commands/'

	  ## process args

	  args = process.argv.slice(0)

	  ## shift off node and script name

	  args.shift(); args.shift();

	  ## parse commands

	  @parseCommands args

  ##
  ## parseCommands (args) ->
  ##

  parseCommands: (args) ->

	  ## command

	  [command] = args

	  ## shift off command

	  args.shift()

	  ##
	  ## process command
	  ##

	  ## target command path

	  commandPath = @paths.commands + command + '.coffee'

	  ## check if command path exists

	  path.exists commandPath, (exists) ->

		  if exists
			  command = require commandPath
			  command.exe CMD, args
		  else
			  #require @paths.commands + "help".exe
			  console.log 'help'

