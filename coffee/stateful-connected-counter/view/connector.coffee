# Connector: Component -> Component

###
This connector is just passing the component through - an identity fn if you will.

This is because we have a statefull view here and we do not want to connect it. We cound just require it directrly from index and hot-reloader, but the goal is to have this modules uniform (never apply custom changes to them), and only change implementation of connector and view.
###
Connector = (component) ->
  component

module.exports =
  Connector
