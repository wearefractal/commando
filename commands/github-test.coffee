sys = require "sys"
GitHubApi = require("github").GitHubApi

exports.exe = (args) ->

	github = new GitHubApi true

	github.getUserApi().getFollowers 'fjakobs', (err, followers) ->
		  console.log followers.join('\n')

		else
			## extract
			console.log 'tar -zxvf ./' + appName + '/template.tar.gz'
			child2 = exec 'tar -C ./'+ appName + ' -zxvf ./' + appName + '/template.tar.gz', (error, stdout, stderr) ->
				if (error?)
					CMD.log error
				else

