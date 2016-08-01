{ render } =
  require "react-dom"
h =
  require "react-hyperscript"

# Redux stuff
Store =
  require "./store"
{ Provider } =
  require "react-redux"

# React components
ConnectedCounter =
  require "./connected-counter"
StatefulCounter =
  require "./stateful-counter"

target =
  document.getElementById "app-container"

store =
  Store
    log:
      yes

root =
  h Provider,
    { store }
    h "div",
      [
        h ConnectedCounter

        h StatefulCounter
      ]

render root, target
