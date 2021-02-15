open Belt

let displayRecipe = (recipe: Store.recipe, dispatch: Store.action => unit) => {
  <div>
    <h2> {React.string(recipe.title)} </h2>
    <div>
      <h3> {React.string("Ingredients")} </h3> <div> {React.string(recipe.ingredients)} </div>
    </div>
    <div>
      <h3> {React.string("Instructions")} </h3> <div> {React.string(recipe.instructions)} </div>
    </div>
    <div>
      <h3> {React.string("Tags")} </h3>
      <div> {recipe.tags->Array.map(tag => <div> {React.string(tag)} </div>)->React.array} </div>
      <AddTag dispatch recipeTitle={recipe.title} />
    </div>
  </div>
}

@react.component
let make = (~state: Store.state, ~title: string, ~dispatch: Store.action => unit) => {
  switch state.recipes->Map.String.get(title) {
  | None => <div> {React.string(title ++ " is not in our database")} </div>
  | Some(recipe) => displayRecipe(recipe, dispatch)
  }
}
