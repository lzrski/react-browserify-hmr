h =
  require "react-hyperscript"
curry =
  require "lodash.curry"
React =
  require "react"
debounce =
  require "lodash.debounce"
{ stateToHTML } =
  require "draft-js-export-html"
{ stateFromHTML } =
  require "draft-js-import-html"
{
  Editor
  EditorState, ContentState, SelectionState
  convertToRaw
  RichUtils, Entity
} =
  require "draft-js"
decorator =
  require "./decorator"
Buttons =
  require "./buttons"
Style =
  require "./draft-style"

# EditorState -> Maybe Entity
getEntityAtCursor = (editorState) ->

  content =
    editorState.getCurrentContent()

  selection =
    editorState.getSelection()

  block =
    content.getBlockForKey selection.getStartKey()

  offset =
    selection.getStartOffset()

  key =
    block.getEntityAt offset

  entity =
    Entity.get key

  [ range ] =
    getRangesForDraftEntity block, key

  selection =
    SelectionState
      .createEmpty block
      .set "anchorKey", block.key
      .set "anchorOffset", range.start
      .set "focusKey", block.key
      .set "focusOffset", range.end


  return selection


removeLink = (editorState, entity) ->
  selection =
    editorState.getSelection()
  # TODO: Implement removeLink function
  # SEE: https://github.com/facebook/draft-js/issues/182
  # If selection is collapsed, remove link from entire entity range
  console.log selection

  # Otherwise remove it from selection range



URLPropmpt = ({dispatch, url = ""}) ->
  h "form.url-prompt",
    onSubmit: (event) ->
      do event.preventDefault
      dispatch "LINK", { url }
    [
      h "input",
        type:
          "text"
        value:
          url
        onChange: (event) ->
          dispatch "URL_UPDATE", event.target.value
    ]

class RichTextEditor extends React.Component
  focus: (what) =>
    setTimeout (() => @[what]?.focus()), 0

  dispatch: (action, data = {}) =>
    { editorState } =
      @state

    switch action
      when "BOLD", "ITALIC", "STRIKETHROUGH"
        @update RichUtils.toggleInlineStyle editorState, action
        @focus "editor"

      when "URL_PROMPT"
        @setState url: "https://"
        @focus "prompt"

      when "URL_UPDATE"
        @setState url: data

      when "LINK"
        @update RichUtils.toggleLink editorState,
          editorState.getSelection(),
          Entity.create "LINK", "MUTABLE", data
        @focus "editor"

      when "UNLINK"
        selection =
          editorState.getSelection()



        # @update RichUtils.toggleLink editorState,
        #
        #   null
        # @focus "editor"

        # @update removeLink editorState
        # range =
        #   getEntityAtCursor editorState
        #
        # return if not range?
        #
        # @update RichUtils.toggleLink editorState,
        #   range,
        #   null

  render: () ->
    { editorState } =
      @state

    h "div",
      [
        h Style

        h Buttons,
          dispatch:
            @dispatch

        h URLPropmpt,
          ref: (prompt) =>
            @prompt =
              prompt
          dispatch:
            @dispatch
          url:
            @state.url

        h "div.editor-pane",
          [
            h Editor, {
              editorState
              ref: (editor) =>
                @editor =
                  editor
              onChange:
                @update
              handleKeyCommand:
                @handleKeyCommand
              cusotmStyleMap:
                STRIKETHROUGH:
                  textDecoration:
                    "line-through"
            }
          ]
      ]

  update: (editorState) =>
    @setState { editorState }
    value =
      stateToHTML editorState.getCurrentContent()
    @onChange value

  handleKeyCommand: (command) =>
    editorState =
      RichUtils.handleKeyCommand @state.editorState, command

    if editorState
      @update editorState
      return yes

    return no

  constructor: (props, context) ->
    super props, context

    contentState =
      stateFromHTML props.value

    @state =
      editorState:
        EditorState.createWithContent contentState, decorator

    @onChange =
      debounce props.onChange, 500

    module.onReload? () =>
      # Update decorator in case it's implementation changed
      editorState =
        EditorState.set @state.editorState, decorator: require "./decorator"

      @setState { editorState }

      return false


module.exports =
  RichTextEditor
