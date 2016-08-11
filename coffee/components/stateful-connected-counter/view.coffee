React =
  require "react"
h =
  require "react-hyperscript"

# Stateless presentational component
class StatefulConnectedCounter extends React.Component
  constructor: (props, context) ->
    super props, context
    @state =
      value: 0
      frequency: 1

  tick: () =>
    @setState value: @state.value + @props.count
    @timer = setTimeout @tick, 1000 / @state.frequency

  componentDidMount: () ->
    do @tick

  componentWillUnmount: () ->
    clearTimeout @timer

  componentWillUpdate: (props, state) ->
    if state.frequency isnt @state.frequency
      clearTimeout @timer
      @timer = setTimeout @tick, 1000 / @state.frequency

  render: () ->
    { value } = @state
    { count, increment, decrement } = @props

    h "div",
      [
        h "div",
          [
            h "h3", "A steteful counter"
            h "p", """
              Tracks some abstract value that changes every tick by a value given in counter below. The ticks occur in a frequency you can set using slider. This value is stored in elements state and should be preserved across hot reloads thanks hot-reloader.
            """
            h "pre", @state.value
          ]

        h "div",
          [
            h "h3", "A connected counter"
            h "p", """
               How much should be added to the value every tick. This counter is connected to the redux store. It should be preserved across hot reloads thanks to store's hot-reloader. See: /src/store.coffee.
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

        h "div",
          [
            h "h3", "A stateful frequency dial"
            h "p", """
               Use this scale to change the frequency of ticks. Every tick a number set via the counter above will be added to the value. The frequency is stored in element's state and should be preserved across hot reloads.
            """

            h "input",
              type:
                "range"
              min: -4
              max: 8
              onChange: (event) =>
                @setState frequency: 2 ** event.target.value


            h "strong",
              if @state.frequency < 1
                denominator = 2 ** (Math.abs Math.log2 @state.frequency)
                "1 / #{denominator} Hz"
              else
                "#{@state.frequency} Hz"
          ]

      ]

module.exports =
  StatefulConnectedCounter
