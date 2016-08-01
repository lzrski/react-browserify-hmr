React =
  require "react"
h =
  require "react-hyperscript"

# Stateless presentational component
Counter = ({count, increment, decrement}) ->
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

module.exports =
  Counter
