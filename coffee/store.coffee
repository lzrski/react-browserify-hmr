redux =
  require "redux"

Logger =
  require "redux-logger"

reducer =
  require "./reducer"

logger = Logger
  collapsed:
    yes
  duration:
    yes

Store = ({ log = yes }) ->
  middleware = [
    logger if log
  ].filter Boolean

  store =
    redux.createStore reducer, redux.applyMiddleware middleware...

  module.onReload () ->
    store.replaceReducer require "./reducer"
    return true

  return store

module.exports =
  Store
