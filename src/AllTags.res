open Belt

@react.component
let make = (~tags: Map.String.t<array<string>>) => {
  Js.log(tags)
  <div> {React.string("All tags")} </div>
}
