###
NOTE: It's OK to copy and paste it. Just remember to change the module paths below (marked with comments).
###

React =
  require "react"
h =
  require "react-hyperscript"
Reloadable =
  require "./counter" # <-- CHANGE HERE

class HotReloader extends React.Component
  constructor: (props, context) ->
    super props, context

    module.onReload @reload

  reload: () =>
    state =
      @reloadable.state
    Reloadable =
      require "./counter" # <-- CHANGE HERE
    @forceUpdate () ->
      @reloadable.setState state

    return true

  render: () =>
    h Reloadable,
      Object.assign {},
        @props
        ref: (reloadable) =>
          @reloadable = reloadable

module.exports =
  HotReloader
