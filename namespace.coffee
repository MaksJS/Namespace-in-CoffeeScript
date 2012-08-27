###
# Elegant pattern to simulate namespace in coffeescript
#
# @param {Object} obj
#
# Use :
# namespace Foo:
#   class Bar extends Baz
#     [...]
###

namespace = (obj) ->
  [name, Class]     = [key, value] for key, value of obj
  target            = exports ? @
  target            = target[subpackage] ||= {} for subpackage in name.split '.'
  className         = Class.name or Class.toString().split('function ')[1].split('()')[0] # for IE
  target[className] = Class