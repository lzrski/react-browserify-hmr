import express from "express"
import React from "react"
import {renderToString} from "react-dom/server"
import Application from "./js/application"

const app = express()

app.get("/", (req, res) => {
  const model = {
    counter1: 10000,
    counter2: -100000
  }
  res.send(`<!DOCTYPE html>
  <html>
    <head>
      <title>2.x basic usage</title>
    </head>
    <body>
      <div id="app-container">${renderToString(<Application {...model} />)}</div>
      <script type="text/javascript">
        window.INITIAL_MODEL = ${JSON.stringify(model)};
      </script>
      <script type="text/javascript" src="/static/application.js"></script>
    </body>
  </html>`)
})

app.get("/static/application.js", function(req, res) {
  res.sendFile("build/application.js", {root: __dirname})
})

app.listen(3000)
