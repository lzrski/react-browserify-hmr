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
RTE =
  require "./RTE"

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

        h "hr"

        h StatefulCounter

        h "hr"

        h RTE,
          value:
            store.getState().content
          onChange: (content) ->
            store.dispatch { type: "update content", content }

      ]

render root, target
