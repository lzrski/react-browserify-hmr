React =
  require "react"
h =
  require "react-hyperscript"

# Stateless presentational component
class FileReaderInput extends React.Component
  render: () ->
    { data, update } = @props

    h "div",
      [
        if data.length > 0 then h "button",
          onClick: () => update ""
          "Remove image"

        h "input",
          type: "file"
          accept: "image/*"
          ref: (input) =>
            @input = input

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
          onClick: () =>
            do @input?.click

        h "code",
          style:
            overflowWrap: "break-word"
            wordBreak: "break-word"

          data
            .replace ///
              ^
              data:
              .+?
              ;
              base64
              ,
            ///, ""
            .substr 0, 256
            .concat "[...]"
      ]

module.exports =
  FileReaderInput
