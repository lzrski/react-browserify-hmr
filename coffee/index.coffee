{ render } =
  require "react-dom"
h =
  require "react-hyperscript"

Application =
  require "./application-proxy"

Store =
  require "./store"

{ Provider } =
  require "react-redux"

target =
  document.getElementById "app-container"

store =
  Store
    log:
      no

root =
  h Provider,
    { store }
    [
      h Application
    ]

render root, target
