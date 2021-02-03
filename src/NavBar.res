module NavButton = {
  @react.component
  let make = (~name: string, ~selected: string, ~linkTo: string) => {
    let style = if selected == name {
      ReactDOM.Style.make(~backgroundColor="#656565", ~padding="1ex", ())
    } else {
      ReactDOM.Style.make(~backgroundColor="#efefef", ~padding="1ex", ())
    }

    <div style={style} onClick={_ => RescriptReactRouter.push(linkTo)}> {React.string(name)} </div>
  }
}

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
