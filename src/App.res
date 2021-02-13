@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  let (state, dispatch) = React.useReducer(Store.reducer, Store.initialState)

  React.useEffect1(() => {
    dispatch(
      Store.AddRecipe({
        title: "Bread",
        ingredients: "flour, salt, water, yeast",
        instructions: "Mix, let rise overnight, bake at 400",
      }),
    )
    dispatch(Store.AddTag({recipeTitle: "Bread", tag: "carbs"}))
    None
  }, [dispatch])

  let component = switch url.path {
  | list{"recipes", "add"} => <div> {React.string("Add Recipe")} </div>
  | list{"recipes", title} => <div> {React.string("View Recipe " ++ title)} </div>
  | list{"tags"} => <AllTags tags={state.tags} />
  | list{} => <div> {React.string("Home page")} </div>
  | _ => <div> {React.string("Route not found")} </div>
  }

  <div> <NavBar /> {component} </div>
}
