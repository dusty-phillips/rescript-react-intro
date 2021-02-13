
@react.component
let make = (~state: Store.state, ~title: string) => {
  <div> {React.string("View Recipe " ++ title)} </div>
}
