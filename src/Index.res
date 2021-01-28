%%raw(`
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import {make as App} from './App.bs';
`)

@module("./reportWebVitals") external reportWebVitals: 'whatever = "default"

%%raw(`
const root = document.getElementById('root')

if (root) {
  ReactDOM.render(
  <React.StrictMode>
  <App />
  </React.StrictMode>,
  root
  );
}

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
`)

reportWebVitals()
