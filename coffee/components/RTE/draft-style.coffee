h =
  require "react-hyperscript"
fs =
  require "fs"

draft_css =
  fs.readFileSync "node_modules/draft-js/dist/Draft.css"

Style = () ->

  h "style", """
    #{draft_css}

    /* custom styles */

    .public-DraftEditor-content {
      min-height: 10em;
      border: solid 1px black;
      padding: 2em
    }
  """
module.exports =
  Style
