@react.component
let make = (~recipeTitle: string, ~dispatch: Store.action => unit) => {
  let (tag, setTag) = React.useState(() => "")
  <div>
    <input
      placeholder="Add tag..."
      value={tag}
      onChange={event => {
        let tag = ReactEvent.Form.target(event)["value"]
        setTag(_ => tag)
      }}
    />
    <button
      onClick={_ => {
        dispatch(Store.AddTag({recipeTitle: recipeTitle, tag: tag}))
      }}>
      {React.string("Add Tag!")}
    </button>
  </div>
}
