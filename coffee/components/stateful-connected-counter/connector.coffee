{ connect } =
  require "react-redux"

# Props: State -> Props
# AKA map state to props
Props = ({ count }) ->
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
  connect Props, Actions, undefined, withRef: yes

module.exports =
  Connector
