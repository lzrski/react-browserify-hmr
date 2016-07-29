const React = require("react")
const h = require("react-hyperscript")

const Application = class Application extends React.Component {
  constructor (props, context) {
    super(props, context)

    this.state = { n: 0 }
  }

  increment() { this.setState({n: this.state.n + 5}) };

  decrement() { this.setState({n: this.state.n - 1}) };

  render() {
    return h(
      "div",
      [
        h("button", { onClick: () => this.increment() }, "+"),
        h("button", { onClick: () => this.decrement() }, "-"),
        h("strong", this.state.n)
      ]
    )
  }
}

module.exports = Application
