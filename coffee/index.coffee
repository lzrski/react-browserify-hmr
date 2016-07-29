{ render } =
  require "react-dom"
h =
  require "react-hyperscript"
Application =
  require "./application"

target =
  document.getElementById "app-container"

root =
  h Application

render root, target
