open Belt

@react.component
let make = (~state: Store.state, ~title: string) => {
  switch state.recipes->Map.String.get(title) {
  | None => <div> {React.string(title ++ " is not in our database")} </div>
  | Some(recipe) => <div> {React.string("View Recipe " ++ recipe.title)} </div>
  }
}
