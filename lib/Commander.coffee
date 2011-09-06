path = require 'path'

##
## parse ->
##
## parses command line input and maps to cli services
##

exports.parse = (args) ->
		
	## command
		
	[command] = args

	## shift off command
	
	args.shift()		
	
	##				
	## process command
	##

	## target command path

	commandPath = CMD.lib + 'commands/' + command + '.coffee'
	
	## check if command path exists
	
	path.exists commandPath, (exists) ->

		if exists
			command = require commandPath
			command.execute args
		else
			console.log 'help'

##
## 
## help
##

exports.help = (args) ->
	
	console.log 'help'
