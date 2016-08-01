{ combineReducers } =
  require "redux"

count = (state = 0, action) ->
  switch action.type
    when "increment"
      state + 1
    when "decrement"
      state - 1
    else
      state

content = (state = "", action) ->
  switch action.type
    when "update content"
      action.content
    else
      state


module.exports =
  combineReducers {
    count
    content
  }
