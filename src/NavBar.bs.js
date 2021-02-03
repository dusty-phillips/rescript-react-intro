// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as RescriptReactRouter from "@rescript/react/src/RescriptReactRouter.bs.js";

function NavBar(Props) {
  var url = RescriptReactRouter.useUrl(undefined, undefined);
  var match = url.path;
  var selected;
  if (match) {
    switch (match.hd) {
      case "recipes" :
          selected = "Recipes";
          break;
      case "tags" :
          selected = "Tags";
          break;
      default:
        selected = "Home";
    }
  } else {
    selected = "Home";
  }
  return React.createElement("div", undefined, selected);
}

var make = NavBar;

export {
  make ,
  
}
/* react Not a pure module */
