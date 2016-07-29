React =
  require "react"
h =
  require "react-hyperscript"
{ connect } =
  require "react-redux"

Application = ({count, increment, decrement}) ->
  h "div",
    [
      h "button",
        onClick: increment,
        "+"

      h "button",
        onClick: decrement,
        "-"

      h "strong",
        count
    ]


ApplicationContainer = do (Application) ->
  Props = ({ count }) ->
    { count }

  Dispatch = (dispatch) ->
    increment: () -> dispatch type: "increment"
    decrement: () -> dispatch type: "decrement"

  Container =
    connect Props, Dispatch

  Container Application

module.exports = ApplicationContainer
