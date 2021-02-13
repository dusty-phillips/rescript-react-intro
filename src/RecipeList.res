open Belt

@react.component
let make = (~recipes: array<string>) => {
  <div>
    {recipes
    ->Array.map(recipe =>
      <div key={recipe} onClick={_ => RescriptReactRouter.push(`/recipes/${recipe}`)}>
        {React.string(recipe)}
      </div>
    )
    ->React.array}
  </div>
}
