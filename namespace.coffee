###
# Elegant pattern to simulate namespace in CoffeeScript
#
# @option {Object} root      by default it's window
# @param  {Object} o         the class we want to include in the namespace
# @author Maks
#
# Note : "separator" variable is the separator for the namespace's subpackages, by default it's a dot, can be a slash \ like PHP's namespaces for example
###

###
# How to use in the browser :
# namespace Foo:
#   class Bar extends Baz
#     [...]
#
# How to use in CommonJS environment :
#
# {namespace} = require './path/to/this/file'
# namespace exports, Foo:
#   class Bar extends Baz
#     [...]
#
# We need this workaround because we must expose the targeted "exports" to this module
#
# Note : if you use subpackages, you will need to quote the name of the namespace 
# namespace 'Foo.bar.baz':
#  class myClass
# namespace 'Foo\bar\baz':
#  class myClass
###

(exports ? window).namespace = (root = window, o) ->
  [o, root]       = [root, window] if window? and root isnt window # dealing with the optional root param
  separator       = '.'
  regex           = /^[\s\r\n]*function[\s\r\n]*([^\(\s\r\n]*?)[\s\r\n]*\([^\)\s\r\n]*\)[\s\r\n]*\{((?:[^}]*\}?)+)\}\s*$/
  [name, Class]   = [key, value] for key, value of o
  root            = root[subpackage] ||= {} for subpackage in name.split separator
  className       = Class.name or regex.exec(Class.toString())[1] # IE doesn't have the name property so we use the Regex here
  root[className] = Class