###
# Elegant pattern to simulate namespace in CoffeeScript
#
# @author Maks
###

((root) ->
  
  fn = ->

    args   = arguments[0]
    target = root

    loop
      for subpackage, obj of args
        target = target[subpackage] or= {}
        args   = obj
      break unless typeof args is 'object'

    Class              = args
    target             = root if arguments[0].hasOwnProperty 'global'
    Class.name        ?= Class.toString().split('function ')[1].split('(')[0] # Fix for IE
    target[Class.name] = Class

  # Aliases
  root.namespace = fn
  root.module    = fn

)(global ? window)