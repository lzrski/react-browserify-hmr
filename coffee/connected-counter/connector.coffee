{ connect } =
  require "react-redux"

Counter =
  require "./counter"

# Props: State -> Props
# AKA map state to props
Props = (state) ->
  { count } =
    state
  { count }

# Actions: Function -> Props
# AKA map dispatch to props
Actions = (dispatch) ->
  increment: () ->
    dispatch type: "increment"
  decrement: () ->
    dispatch type: "decrement"

# Container: Component -> Component
Connector =
  connect Props, Actions

module.exports =
  Connector
