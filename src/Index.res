@module("./reportWebVitals") external reportWebVitals: unit => unit = "default"

{
  let maxwidth = 40.0
  open CssJs
  global(.
    "body",
    [
      fontFamily(#custom("Garamond")),
      maxWidth(maxwidth->#rem),
      border(1->px, #solid, lightgrey),
      margin(2.0->#rem),
    ],
  )
  global(.
    "h1, h2, h3",
    [
      color("656565"->hex),
      borderBottom(1->px, #dashed, lightgrey),
      maxWidth((maxwidth /. 2.0)->#rem),
    ],
  )
}

let rootQuery = ReactDOM.querySelector("#root")

switch rootQuery {
| None => ()
| Some(root) => ReactDOM.render(<App />, root)
}

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals

reportWebVitals()
