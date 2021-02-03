@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  let selected = switch url.path {
  | list{"recipes", ..._} => "Recipes"
  | list{"tags", ..._} => "Tags"
  | _ => "Home"
  }

  <div> {React.string(selected)} </div>
}
