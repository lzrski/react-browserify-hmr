React =
  require "react"
h =
  require "react-hyperscript"

class Application extends React.Component
  constructor: (props, context) ->
    super props, context
    this.state =
      n: 0

  increment: () => this.setState n: this.state.n + 2

  decrement: () => this.setState n: this.state.n - 2

  render: () =>
    h "div",
      [
        h "button", onClick: @increment, "+"
        h "button", onClick: @decrement, "-"
        h "strong", this.state.n
      ]

module.exports = Application
