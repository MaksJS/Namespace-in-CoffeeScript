###
# Elegant pattern to simulate namespace in CoffeeScript
#
# @author Maks
###

((root) ->
  
  # Separator for packages, can be a dot, a slash...
  separator = '.'

  fn = ->
    [name, Class]      = [key, value] for key, value of arguments[0]
    target             = (target ?= root)[subpackage] or= {} for subpackage in name.split separator
    target             = root if name is 'global'
    Class.name        ?= Class.toString().split('function ')[1].split('(')[0] # Fix for IE
    target[Class.name] = Class

  # Aliases
  root.namespace = fn
  root.module    = fn

)(global ? window)