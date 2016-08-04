h =
  require "react-hyperscript"
React =
  require "react"
{ default: RTE  }=
  require "react-rte"

class RichTextEditor extends React.Component
  constructor: () ->
    @state =
      value: RTE.createEmptyValue()

  render: () ->
    h RTE,
      value   : @state.value
      onChange: (value) => @setState { value }

module.exports =
  RichTextEditor
