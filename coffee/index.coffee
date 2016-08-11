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
  require "./components/connected-counter"
StatefulCounter =
  require "./components/stateful-counter"
StatefulConnectedCounter =
  require "./components/stateful-connected-counter"
MCE =
  require "./components/MCE"
RTE =
  require "./components/RTE"
FileReader =
  require "./components/file-reader"

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
        h StatefulCounter
        h "hr"
        h ConnectedCounter
        h "hr"
        h StatefulConnectedCounter
        h "hr"
        h FileReader
        h "hr"
        h MCE
        h "hr"
        h RTE
      ]

render root, target
