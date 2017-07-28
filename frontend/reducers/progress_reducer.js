import merge from 'lodash/merge';

const ProgressReducer = (state = {}, action) => {
  Object.freeze(state);

  let defaultState = {
    lessonMax: 1,
    unitMax: 1
  };


    switch(action.type){
      case "UPDATE_CURRENT_LESSON":
        const currentLesson = { lessonMax: action.data.lessonId};
        const currentUnit = { unitMax: action.data.unitId};
        return merge(defaultState, state, currentLesson, currentUnit);
      case "RECEIVE_CURRENT_USER":
        console.log("progress reducer",action);
        if (action.currentUser){
          console.log("in currentUser");
          const lessonId = action.currentUser.lesson_id;
          const unitId = action.currentUser.unit_id;
          const nextState = {lessonMax: lessonId, unitMax: unitId};
          return merge(defaultState, state, nextState);
        }
        return merge(defaultState, state);
      default:
        return merge(defaultState, state);
    }
  };

  export default ProgressReducer;
