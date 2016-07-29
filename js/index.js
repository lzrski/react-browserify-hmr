import React from "react"
import { render } from "react-dom"

const target =
  document.getElementById("app-container")

class Application extends React.Component {
  constructor (props, context) {
    super(props, context)

    this.state = { n: 0 }
  }

  increment() { this.setState({n: this.state.n + 1}) };

  decrement() { this.setState({n: this.state.n - 1}) };

  render() {
    return <div>
      <button onClick = { this.increment.bind(this) }>+</button>
      <button onClick = { this.decrement.bind(this) }>-</button>
      <strong>{ this.state.n }</strong>
    </div>
  }
}

const root =
  <Application />

render(root, target)
