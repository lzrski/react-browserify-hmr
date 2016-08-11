###

WARNING: What you are looking at is probably a symlink to src/components/_hot/realoder.coffee

You probably do not need to touch this. If you do, take extra care - any change will ripple to every component.

Also note, that the original file (i.e. not any of the symlinks) is not suppose to be required. See ../index.coffee if you are curious where it is being used.

###

React =
  require "react"
h =
  require "react-hyperscript"
View =
  require "./view"
Connector =
  require "./connector"

Reloadable =
  Connector View

get_instance = (reloadable) ->
  if typeof reloadable?.getWrappedInstance is "function"
    # It's a connected component (most likely case)
    reloadable.getWrappedInstance()
  else
    # It's not a connected component (e.g. Connector is an identity fn)
    reloadable

class HotReloader extends React.Component
  constructor: (props, context) ->
    super props, context

    module.onReload @reload

  reload: () =>
    ###

    Load new implementation of View and Connector (composed together into Reloadable)

    ###
    View =
      require "./view"
    Connector =
      require "./connector"

    Reloadable =
      Connector View


    ###

    Instance is either reloadable itself, or a wrapped View instance.

    ###

    instance = get_instance @reloadable

    if not instance?
      ###

      Elements created from stateless components (i.e. functions) cannot be referenced (they always pass null to ref callback). But that's OK bacause they cannot have state (hence the name :). Let's just terminate early for them.

      ###
      @forceUpdate () ->
        # Do nothing...
      return true

    ###

    Preserve the state of the reloadable stateless element

    ###
    { state } =
      instance

    @forceUpdate () ->
      get_instance @reloadable
        ?.setState state

    return true

  render: () =>
    h Reloadable,
      Object.assign {},
        @props
        ref: (reloadable) =>
          @reloadable = reloadable

module.exports =
  HotReloader
