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

let reducer = (state: state, action: action) => {
  switch action {
  | AddRecipe({title, ingredients, instructions}) => {
      recipes: state.recipes->Map.String.set(
        title,
        {title: title, ingredients: ingredients, instructions: instructions, tags: []},
      ),
      tags: state.tags,
    }
  | AddTag({recipeTitle, tag}) => {
      let recipeOption = state.recipes->Map.String.get(recipeTitle)

      switch recipeOption {
      | Some(recipe) => {
          let recipeTags = recipe.tags->Array.concat([tag])
          let recipes = state.recipes->Map.String.set(recipe.title, {...recipe, tags: recipeTags})

          let tags = state.tags->Map.String.update(tag, taggedRecipesOption =>
            switch taggedRecipesOption {
            | None => Some([recipe.title])
            | Some(taggedRecipes) => Some(taggedRecipes->Array.concat([recipe.title]))
            }
          )

          {
            recipes: recipes,
            tags: tags,
          }
        }
      | None => state
      }
    }
  }
}
