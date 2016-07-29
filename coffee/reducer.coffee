module.exports = (state = count: 0, action) ->
  { count } = state
  return switch action.type
    when "increment" then { count: count + 1 }
    when "decrement" then { count: count - 1 }
    else state
