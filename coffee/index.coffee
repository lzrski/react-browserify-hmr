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
MCE =
  require "./MCE"
FileReader =
  require "./file-reader"

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
        h FileReader
      ]

render root, target
