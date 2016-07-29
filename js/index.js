const { render } = require("react-dom")
const h = require("react-hyperscript");
const Application = require("./application")

const target =
  document.getElementById("app-container")

const root =
  h(Application)

render(root, target)
