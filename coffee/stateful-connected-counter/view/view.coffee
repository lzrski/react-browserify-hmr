React =
  require "react"
h =
  require "react-hyperscript"

# Stateless presentational component
class StatefulThing extends React.Component
  constructor: (props, context) ->
    super props, context
    @state =
      age: 0

  componentDidMount: () ->
    tick = () =>
      @setState age: @state.age - 1

    @timer = setInterval tick, 1000

  componentWillUnmount: () ->
    clearInterval @timer

  render: () ->
    { age } = @state
    { count, increment, decrement } = @props

    h "div",
      [
        h "div",
          [
            h "h3", "A steteful counter"
            h "p", """
              Tracks the time this element is mounted. Should be preserved across hot reloads thanks to internal hot-reloader.
            """
            h "pre", @state.age
          ]

        h "div",
          [
            h "h3", "A connected counter"
            h "p", """
               This counter is connected to the redux store. It should be preserved across hot reloads thanks to store's hot-reloader. See: /src/store.coffee.
            """

            h "button",
              onClick: decrement,
              "-"

            h "button",
              onClick: increment,
              "+"

            h "strong",
              count
          ]

      ]

module.exports =
  StatefulThing
