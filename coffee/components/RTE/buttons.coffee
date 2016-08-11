h =
  require "react-hyperscript"

Buttons = ({dispatch}) ->
  h "div.editor-controls", [
    h "button.bold",
      onClick: () =>
        dispatch "BOLD"
      "B"
    h "button.strikethrough",
      onClick: () =>
        dispatch "ITALIC"
      "Italic"
    h "button.strikethrough",
      onClick: () =>
        dispatch "STRIKETHROUGH"
      "S"
    h "button.link",
      onClick: () =>
        dispatch "URL_PROMPT"
      "L"
    h "button.unlink",
      onClick: () =>
        dispatch "UNLINK"
      "Remove link"
  ]

module.exports =
  Buttons
