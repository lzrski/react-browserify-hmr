module.exports =
  if process.env.NODE_ENV is "development"
    console.log "View is required"
    require "./hot-reloader"
  else
    require "./view"
