h =
  require "react-hyperscript"
curry =
  require "lodash.curry"
debounce =
  require "lodash.debounce"
{
  CompositeDecorator, Entity
} =
  require "draft-js"

# Range: [Integer, Integer] => RegExp -> String -> Array Range
find = curry (re, text) ->
  loop
    match =
      re.exec text
    break if match is null
    [
      match.index
      match.index + match[0].length
    ]


filter_characters = (character) ->
  key =
    character.getEntity()

  if not key? then return false

  type =
    Entity
      .get key
      .getType()

  return type is "LINK"

decorator = new CompositeDecorator (
  data for name, data of (
    mention:
      strategy: (block, callback) ->
        callback range... for range in find /@\w+/g, block.getText()
      component: ({ children }) ->
        h "strong",
          children

    scream:
      strategy: (block, callback) ->
        callback range... for range in find /\w+(?=\!\!\!)/g, block.getText()
      component: ({ children }) ->
        h "strong",
          style: color: "red"
          children

    link:
      strategy: (block, callback) ->
        block.findEntityRanges filter_characters, (args...) ->
          callback args...

      component: ({ children, entityKey }) ->
        { url: href } =
          Entity
            .get entityKey
            .getData()

        h "a",
          {
            href
          }
          children
  )
)

module.exports =
  decorator
