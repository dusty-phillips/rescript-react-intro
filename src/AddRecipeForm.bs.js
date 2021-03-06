// Generated by ReScript, PLEASE EDIT WITH CARE

import * as CssJs from "bs-css-emotion/src/CssJs.bs.js";
import * as Curry from "bs-platform/lib/es6/curry.mjs";
import * as React from "react";
import * as RescriptReactRouter from "@rescript/react/src/RescriptReactRouter.bs.js";
import * as CardStyles$RescriptReactIntro from "./CardStyles.bs.js";

var longEntry = CssJs.style([
      CssJs.width({
            NAME: "percent",
            VAL: 100.0
          }),
      CssJs.maxWidth({
            NAME: "rem",
            VAL: 20.0
          }),
      CssJs.borderRadius({
            NAME: "rem",
            VAL: 0.5
          }),
      CssJs.padding({
            NAME: "rem",
            VAL: 0.5
          })
    ]);

var Styles = {
  longEntry: longEntry
};

function AddRecipeForm(Props) {
  var dispatch = Props.dispatch;
  var match = React.useState(function () {
        return "";
      });
  var setTitle = match[1];
  var title = match[0];
  var match$1 = React.useState(function () {
        return "";
      });
  var setIngredients = match$1[1];
  var ingredients = match$1[0];
  var match$2 = React.useState(function () {
        return "";
      });
  var setInstructions = match$2[1];
  var instructions = match$2[0];
  return React.createElement("div", {
              className: CardStyles$RescriptReactIntro.formCard
            }, React.createElement("div", undefined, React.createElement("input", {
                      className: longEntry,
                      placeholder: "Title",
                      value: title,
                      onChange: (function ($$event) {
                          var title = $$event.target.value;
                          return Curry._1(setTitle, (function (param) {
                                        return title;
                                      }));
                        })
                    })), React.createElement("div", undefined, React.createElement("label", undefined, React.createElement("h3", undefined, "Ingredients"), React.createElement("textarea", {
                          className: longEntry,
                          value: ingredients,
                          onChange: (function ($$event) {
                              var ingredients = $$event.target.value;
                              return Curry._1(setIngredients, (function (param) {
                                            return ingredients;
                                          }));
                            })
                        }))), React.createElement("div", undefined, React.createElement("label", undefined, React.createElement("h3", undefined, "Instructions"), React.createElement("textarea", {
                          className: longEntry,
                          value: instructions,
                          onChange: (function ($$event) {
                              var instructions = $$event.target.value;
                              return Curry._1(setInstructions, (function (param) {
                                            return instructions;
                                          }));
                            })
                        }))), React.createElement("button", {
                  onClick: (function (param) {
                      Curry._1(dispatch, {
                            TAG: /* AddRecipe */0,
                            title: title,
                            ingredients: ingredients,
                            instructions: instructions
                          });
                      return RescriptReactRouter.push("/recipes/" + title);
                    })
                }, "Add!"));
}

var make = AddRecipeForm;

export {
  Styles ,
  make ,
  
}
/* longEntry Not a pure module */
