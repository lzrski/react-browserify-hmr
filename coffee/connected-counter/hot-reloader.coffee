###
NOTE: It's OK to copy and paste it. Just remember to change the module paths below (marked with comments).

See the index.coffee file to see how to use it.

TODO: Implement a browserify transform / plugin to automatically inject theese.

###

React =
  require "react"
h =
  require "react-hyperscript"
Reloadable =
  require "./connected-counter" # <-- CHANGE HERE

class HotReloader extends React.Component
  constructor: (props, context) ->
    super props, context

    module.onReload @reload

  reload: () =>
    state =
      @reloadable.state
    Reloadable =
      require "./connected-counter" # <-- CHANGE HERE
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
