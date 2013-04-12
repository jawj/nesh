require 'colors'

coffee = require 'coffee-script'
log = require '../log'
path = require 'path'

exports.setup = (context) ->
    {nesh} = context
    log.debug 'Loading CoffeeScript'
    nesh.compile = (data) ->
        coffee.compile data, {bare: true, header: false}
    nesh.repl = require 'coffee-script/lib/coffee-script/repl'
    process.versions['coffee-script'] = coffee.VERSION
    nesh.defaults.welcome = "CoffeeScript #{coffee.VERSION} on Node #{process.version}\nType " + '.help'.cyan + ' for more information'
    nesh.defaults.prompt = 'coffee> '
    nesh.defaults.historyFile = path.join(process.env.HOME, '.coffee_history')
