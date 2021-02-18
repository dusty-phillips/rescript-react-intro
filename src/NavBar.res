module Styles = {
  open CssJs

  let navButton = selected =>
    style(. [
      backgroundColor(
        if selected {
          "656565"->hex
        } else {
          "efefef"->hex
        },
      ),
      padding(1.0->ex),
      cursor(#pointer),
    ])
}

module NavButton = {
  @react.component
  let make = (~name, ~selected, ~linkTo) => {
    <div
      className={Styles.navButton(selected === name)}
      onClick={_ => RescriptReactRouter.push(linkTo)}>
      {React.string(name)}
    </div>
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

  <div style={ReactDOM.Style.make(~display="flex", ~justifyContent="center", ())}>
    <NavButton name="Home" selected={selected} linkTo="/" />
    <NavButton name="Tags" selected={selected} linkTo="/tags" />
    <NavButton name="Recipes" selected={selected} linkTo="/recipes/add" />
  </div>
}
