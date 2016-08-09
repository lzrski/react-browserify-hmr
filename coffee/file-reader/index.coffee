module.exports =
  if process.env.NODE_ENV is "development"
    require "./hot-reloader"
  else
    require "./connected-view"
