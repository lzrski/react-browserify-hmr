###

WARNING: What you are looking at is probably a symlink to src/components/index.coffee

You probably do not need to touch this. If you do, take extra care - any change will ripple to every component.

Also note, that the original file (i.e. not any of the symlinks) is not suppose to be required.

###

module.exports = do () ->
  if process.env.NODE_ENV is "development"

    module.onReload () ->
      # Do not propagate reloading
      true

    try
      return require "./_hot-reloader"
    catch error
      # TODO: Check what kind of error this actually is
      console.error "Caught", error

      console.warn """
        Hot module replacement not set for #{__dirname}. Did you remember to symlink src/_hot to this module's directory? It won't work otherwise.
      """

  ###
  Note return statement in the try clause above

  Code below will only be executed if either:

    * NODE_ENV is not development
    * ./_hot/reloader module does not exist

  ###
  View =
    require "./view"
  Connector =
    require "./connector"

  return Connector View
