h =
  require "react-hyperscript"
React =
  require "react"
MCE =
  require "react-tinymce"
inject_script =
  require "../inject_script"

class RichTextEditor extends React.Component
  constructor: (props, context) ->
    super props, context

    @state =
      ready : no


  componentDidMount: () ->
    # Inject tinyMCE script in a hacky way.
    # This makes me a little sad :(
    inject_script "https://cdn.tinymce.com/4/tinymce.min.js",
      "tinyMCE"
      (error) =>
        if error then throw error
        @setState ready: yes

  update: (event) =>
    value = event.target.getContent()
    console.log "content update", value
    @props.update value

  render: () ->
    if @state.ready
      h MCE,
        content : @props.content
        onChange: @update
        config  :
          menubar : false
          plugins : "link lists print preview fullscreen"
          toolbar : [
            "undo redo"
            "formatselect"
            "bold italic strikethrough underline"
            "bullist numlist"
            "link unlink"
            "fullscreen"
          ].join " | "
    else
      h "pre",
        "loading TinyMCE..."



module.exports =
  RichTextEditor
