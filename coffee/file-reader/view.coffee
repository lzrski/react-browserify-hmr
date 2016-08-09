React =
  require "react"
h =
  require "react-hyperscript"

# Stateless presentational component
FileReaderInput = ({data, update}) ->
  h "div",
    [
      h "input",
        type: "file"
        onChange: (event) ->
          [ file ] = event.target.files
          # update URL.createObjectURL file
          reader = new FileReader
          reader.addEventListener "load", () ->
            update reader.result

          if file? then reader.readAsDataURL file

      h "img",
        src: data
        style:
          maxWidth: "100%"

      h "code", data.replace ///
        ^
        data:
        .+?
        ;
        base64
        ,
      ///, ""
    ]

module.exports =
  FileReaderInput
