##
## CommandStack
##
## added 'Stack' to avoid confusion
##

_ = require 'nimble'

##module.exports = (commandStack) -> new Command commandStack

module.exports = 

class CommandStack
	
	constructor: ->
		@commandStack = new Array
	
	##
	## Add service to @commandStack
	##
	
	add: (service) ->
		@commandStack.push service
	
	##
	## Alias of parallel (async)
	##
	
	run: -> @parallel()
	
	##
	## Run services in @commandStack in parallel (async)
	##
		
	parallel: (done) ->
		_.parallel @commandStack, done ##, (err, results) -> ##console.log ' ' + results 			
		
	##
	## Run services in @commandStack series (sync)
	##	

	series: (done) ->
		##console.log @commandStack
		_.series @commandStack, done ##, (err, results) -> ##console.log results