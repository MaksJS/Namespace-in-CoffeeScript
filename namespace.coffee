#= require_self

# Define the global namespace as 'root'.
root = module?.parent?.exports ? window

###
  @fn namespace
  Allows you to implement a namespace of objects to the global namespace.
###
root.namespace = (scope) ->
  verify_filling = (propertyName,object,value = {}) =>
    if !object.hasOwnProperty propertyName
      object[propertyName] = value
    object[propertyName]

  base = root

  for own key, value of scope
    components = key.split "."
    firstKey = components.shift()
    base = verify_filling firstKey, base

    for component in components
      verify_filling component, base
      base = base[component]

    for own propertyName, propertyValue of value
      verify_filling propertyName, base, propertyValue
  base

namespace window:
  namespace : namespace
