// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as RescriptReactRouter from "@rescript/react/src/RescriptReactRouter.bs.js";

function App(Props) {
  var url = RescriptReactRouter.useUrl(undefined, undefined);
  var match = url.path;
  if (!match) {
    return React.createElement("div", undefined, "Home page");
  }
  switch (match.hd) {
    case "recipes" :
        var match$1 = match.tl;
        if (match$1) {
          var title = match$1.hd;
          if (title === "add") {
            if (!match$1.tl) {
              return React.createElement("div", undefined, "Add Recipe");
            }
            
          } else if (!match$1.tl) {
            return React.createElement("div", undefined, "View Recipe " + title);
          }
          
        }
        break;
    case "tags" :
        if (!match.tl) {
          return React.createElement("div", undefined, "All tags");
        }
        break;
    default:
      
  }
  throw {
        RE_EXN_ID: "Match_failure",
        _1: [
          "App.res",
          5,
          2
        ],
        Error: new Error()
      };
}

var make = App;

export {
  make ,
  
}
/* react Not a pure module */
