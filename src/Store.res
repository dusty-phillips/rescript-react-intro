open Belt

type recipe = {
  title: string,
  ingredients: string,
  instructions: string,
  tags: array<string>,
}

type state = {
  recipes: Map.String.t<recipe>,
  tags: Map.String.t<array<string>>,
}

let initialState: state = {
  recipes: Map.String.empty,
  tags: Map.String.empty,
}

type action =
  | AddRecipe({title: string, ingredients: string, instructions: string})
  | AddTag({recipeTitle: string, tag: string})

let addRecipe = (state: state, title: string, ingredients: string, instructions: string) => {
  {
    recipes: state.recipes->Map.String.set(
      title,
      {title: title, ingredients: ingredients, instructions: instructions, tags: []},
    ),
    tags: state.tags,
  }
}

let updateTagsArray = (taggedRecipesOption: option<array<string>>, recipeTitle: string) => {
  switch taggedRecipesOption {
  | None => Some([recipeTitle])
  | Some(taggedRecipes) => Some(taggedRecipes->Array.concat([recipeTitle]))
  }
}

let addTag = (state: state, recipeTitle: string, tag: string) => {
  let recipeOption = state.recipes->Map.String.get(recipeTitle)

  switch recipeOption {
  | None => state
  | Some(recipe) => {
      let recipeTags = recipe.tags->Array.concat([tag])
      let recipes = state.recipes->Map.String.set(recipe.title, {...recipe, tags: recipeTags})

      let tags =
        state.tags->Map.String.update(tag, taggedRecipesOption =>
          updateTagsArray(taggedRecipesOption, recipe.title)
        )

      {
        recipes: recipes,
        tags: tags,
      }
    }
  }
}

let reducer = (state: state, action: action) => {
  switch action {
  | AddRecipe({title, ingredients, instructions}) =>
    addRecipe(state, title, ingredients, instructions)
  | AddTag({recipeTitle, tag}) => addTag(state, recipeTitle, tag)
  }
}
