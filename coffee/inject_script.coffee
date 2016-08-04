inject_script = (src, test, callback) ->
  if typeof test is "string"
    name = test
    test = () -> window[name]?

  if test src then return callback null

  script = document.createElement "script"
  script.src = src
  document.body.appendChild script

  interval  = null
  timeout   = null

  check = () ->
    if test src
      clearInterval interval
      clearInterval timeout
      callback null

  fail = (error) ->
    clearInterval interval
    callback error

  interval  = setInterval check, 50
  timeout   = setTimeout fail, 5000, Error """
    Timeout waiting for #{src}. Verify that script is loading and check if test is correct.
  """

module.exports =
  inject_script
