###
# Elegant pattern to simulate namespace in CoffeeScript
#
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
#
# namespace Foo:
#   class Bar extends Baz
#     [...]
#
# Note : if you use subpackages, you will need to quote the name of the namespace 
# namespace 'Foo.bar.baz':
#  class myClass
# namespace 'Foo\bar\baz':
#  class myClass
###

(exports ? window).namespace = ->
  separator         = '.'
  regex             = /^[\s\r\n]*function[\s\r\n]*([^\(\s\r\n]*?)[\s\r\n]*\([^\)\s\r\n]*\)[\s\r\n]*\{((?:[^}]*\}?)+)\}\s*$/
  root              = module?.parent?.exports ? window
  [name, Class]     = [key, value] for key, value of arguments[0]
  root              = root[subpackage] ||= {} for subpackage in name.split separator
  className         = Class.name or regex.exec(Class.toString())[1] # IE doesn't have the name property so we use the Regex here
  root[className]   = Class
  window[className] = root[className] if window? # Force to expose the namespace to the global namespace if the class is wrapped into the coffeescript safety wrapper