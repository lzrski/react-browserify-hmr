Counter =
  require "./counter"

Connector =
  require "./connector"

###
CounterContainer: Component
A statefull container component for stateless Counter.
###
ConnectedCounter =
  Connector Counter

module.exports =
  ConnectedCounter
