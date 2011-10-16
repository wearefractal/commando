##
## $ commander create "appName"
##

fs = require 'fs'
path = require 'path'
exec = require('child_process').exec

exports.exe = (args) ->

	## map args

	[appName] = args
	appPath = './' + appName

	## check if a folder with appName exists

	path.exists appPath, (exists) ->

		if exists

			CMD.error "folder already exists with name '#{appName}'"
			process.exit 1

	## if not, clone the repo

		else

			## clone npm-boilerplate into a new app dir

			exec "git clone git@github.com:wearefractal/npm-boilerplate.git #{appPath}", CMD.log(arguments)

