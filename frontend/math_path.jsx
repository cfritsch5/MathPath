import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';

// Testing __________________
import * as UnitsUtil from './util/units_util';
import * as UnitActions from './actions/units_actions';
import * as LessonActions from './actions/lesson_actions';
import * as LessonUtil from "./util/lessons_util";
// Testing __________________


document.addEventListener('DOMContentLoaded', () => {

  let store;
  if (window.currentUser) {
    const preloadedState = { session: { currentUser: window.currentUser } };
    store = configureStore(preloadedState);
    delete window.currentUser;
  } else {
    store = configureStore();
  }
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);

  // Testing __________________
  window.store = store;
  window.UnitsUtil = UnitsUtil;
  window.UnitActions = UnitActions;
  window.LessonUtil = LessonUtil;
  window.LessonActions = LessonActions;
  // Testing __________________

});
