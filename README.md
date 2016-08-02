# React - Redux - Browserify - CoffeeScript - Hot Module Replacement

Sample project showing how (or **if**) the following stack can work together:

⚛ React + Redux
🎩 Browserify
☕ CoffeeScript
🌶 Hot Module Replacement

Call me an old dog, but I don't really like ES2015 and WebPack. Some features are nice (namely generators, native promises and hot module replacement) but bloated, inconsistent and unintuitive syntax or heavy and fragile configuration is deterring me from those fashionable technologies. I like CoffeeScript and Browserify. Let's see if an old dog can learn some new tricks :)


## What currently works

1.  Reducer reloading

    See the [store implementation](./coffee/store.coffee).

1.  Connected components

    built using `react-redux.connect`. See [Connected Counter example](./coffee/connected-counter).

1.  Stateful components implemented with CoffeeScript classes

# How to set this up

> TODO: How to set this up
> Still trying to figure this out :)

## What can be improved

Help is very much appreciated. Just open a PR to make me happy. Also open an issue to still make me happy, alas not as much as with a PR.

1.  Source maps are going crazy

    * Grossly inaccurate line numbers.

    * Sources are not being updated after hot reload (the original code is being displayed).

    This makes it pretty much imposible to work with developer's tools in the browser : (

    On the other hand having hot module replacement makes it easier to work without them :)

1.  Stateful components need a helper wrapper to preserve state

    If you have a component like that:

    ```coffee-script
    class MyComponent extends React.Component
      # ...
    ```

    Then you need to wrap it with a `HotReloader` component [like this one](./coffee/stateful-counter/hot-reloader.coffee). Unfortunatly a HotReloader must be implemented (i.e. copy and pasted with two lines altered) for every stateful component in your app. My guess is that it could be easily automated with a simple browserify transform.


## Open questions

1.  Do we really need babelify?

    It seems to be working just as well without it. Maybe third party components will need it to preserve state when parent is reloaded?

    > TODO: Check if babelify can be dropped
