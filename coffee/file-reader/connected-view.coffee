###
NOTE: You probably do not need to touch this.
###
View =
  require "./view"

Connector =
  require "./connector"

###
CounterContainer: Component
A statefull container component for stateless Counter.
###
ConnectedView =
  Connector View

module.exports =
  ConnectedView
