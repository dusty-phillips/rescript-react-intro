open Belt

@react.component
let make = (~tags: Map.String.t<array<string>>) => {
  let tagComponents =
    tags
    ->Map.String.toArray
    ->Array.map(((tag, recipes)) =>
      <div key={tag}> <h2> {React.string(tag)} </h2> <RecipeList recipes /> </div>
    )
    ->React.array
  <div> {tagComponents} </div>
}
