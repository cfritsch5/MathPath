import {merge} from 'lodash';

import {
  RECEIVE_CURRENT_USER,
  RECEIVE_ERRORS
} from '../actions/session_actions';

const nullUser = Object.freeze({
  currentUser: null,
  errors: []
});

const SessionReducer = (state = nullUser, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_CURRENT_USER:
      const currentUser = action.currentUser;
      console.log(action.currentUser);
      return merge({}, nullUser, {
        currentUser
      });
    // case RECEIVE_CURRENT_USER:
    //   // const currentUser = action.currentUser;
    //   console.log(action.currentUser);
    //   let currentUser;
    //   if (action.currentUser){
    //     currentUser = {
    //       id: action.currentUser.id,
    //       username: action.currentUser.username
    //     };
    //   } else {
    //     currentUser = {};
    //   }
    //   console.log(currentUser);
    //   return merge({}, nullUser, {
    //     currentUser
    //   });
    case RECEIVE_ERRORS:
      const errors = action.errors;
      return merge({}, nullUser, {
        errors
      });
    default:
      return state;
  }
};

export default SessionReducer;
