React =
  require "react"
h =
  require "react-hyperscript"
Application =
  require "./stateful-application"

class ApplicationProxy extends React.Component
  constructor: (props, context) ->
    super props, context

    module.onReload @reload

  reload: () =>
    state = @app.state
    Application = require "./stateful-application"
    @forceUpdate () ->
      console.log "forced update"
      @app.setState state

    return true

  render: () =>
    h Application,
      Object.assign {}, @props, ref: (element) => @app = element

module.exports = ApplicationProxy
