{ connect } =
  require "react-redux"

# Props: State -> Props
# AKA map state to props
Props = ({ file }) ->
  data:
    file

# Actions: Function -> Props
# AKA map dispatch to props
Actions = (dispatch) ->
  update: (data) ->
    dispatch {type: "update file", data}

# Container: Component -> Component
Connector =
  connect Props, Actions

module.exports =
  Connector
