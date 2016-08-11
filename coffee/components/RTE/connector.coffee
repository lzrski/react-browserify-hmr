{ connect } =
  require "react-redux"

# Props: State -> Props
# AKA map state to props
Props = ({ draft }) ->
  value: draft

# Actions: Function -> Props
# AKA map dispatch to props
Actions = (dispatch) ->
  update: (value) ->
    dispatch type: "update draft", content: value

# Container: Component -> Component
Connector =
  connect Props, Actions, undefined, withRef: yes

module.exports =
  Connector
