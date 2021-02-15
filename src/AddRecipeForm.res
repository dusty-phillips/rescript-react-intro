@react.component
let make = (~dispatch: Store.action => unit) => {
  <div>
    <div> <input placeholder="Title" /> </div>
    <div> <label> <h3> {React.string("Ingredients")} </h3> <textarea /> </label> </div>
    <div> <label> <h3> {React.string("Instructions")} </h3> <textarea /> </label> </div>
    <button> {React.string("Add!")} </button>
  </div>
}
