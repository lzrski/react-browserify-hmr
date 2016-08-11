{ connect } =
  require "react-redux"

# Props: State -> Props
# AKA map state to props
Props = (state) ->
  { content } =
    state
  { content }

# Actions: Function -> Props
# AKA map dispatch to props
Actions = (dispatch) ->
  update: (value) ->
    dispatch type: "update content", content: value

# Container: Component -> Component
Connector =
  connect Props, Actions, undefined, withRef: yes

module.exports =
  Connector
