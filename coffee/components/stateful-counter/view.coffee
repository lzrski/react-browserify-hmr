React =
  require "react"
h =
  require "react-hyperscript"

###
This is a statefull version of counter. It is not connected to redux store, but instead keeps it's own state. To be hot reloaded it requires a helper wrapper defined in hot-reloader module. See also index file.
###
class Counter extends React.Component
  constructor: (props, context) ->
    super props, context
    this.state =
      n: 0

  increment: () => this.setState n: this.state.n + 1

  decrement: () => this.setState n: this.state.n - 1

  render: () =>
    h "div",
      [
        h "button", onClick: @increment, "+"
        h "button", onClick: @decrement, "-"
        h "strong", this.state.n
      ]

module.exports =
  Counter
