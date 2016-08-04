###
NOTE: It's OK to copy and paste it. Just remember to change the module paths below (marked with comments).
###

React =
  require "react"
h =
  require "react-hyperscript"
Reloadable =
  require "./editor" # <-- CHANGE HERE

class HotReloader extends React.Component
  constructor: (props, context) ->
    super props, context

    module.onReload @reload

  reload: () =>
    console.log "reloading"
    state =
      @reloadable.state
    Reloadable =
      require "./editor" # <-- CHANGE HERE
    @forceUpdate () ->
      console.log "reloading", state
      @reloadable.setState state

    return true

  render: () =>
    h Reloadable,
      Object.assign {},
        ref: (reloadable) =>
          @reloadable = reloadable

module.exports =
  HotReloader
