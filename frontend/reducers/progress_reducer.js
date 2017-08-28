import merge from 'lodash/merge';

const ProgressReducer = (state = {}, action) => {
  Object.freeze(state);

  let defaultState = {
    lessonMax: 2,
    unitMax: 2,
    maxUnit: 5
  };

  let lessonId, unitId, nextState, maxUnit;
  console.log("progstate",state);
    switch(action.type){
      case "UPDATE_CURRENT_LESSON":
        lessonId = action.data.lessonId;
        unitId = action.data.unitId;
        nextState = {lessonMax: lessonId, unitMax: unitId};
        return merge(defaultState, state, nextState);
      case "RECEIVE_CURRENT_USER":
        if (action.currentUser){
          lessonId = action.currentUser.lesson_id;
          unitId = action.currentUser.unit_id;
          nextState = {lessonMax: lessonId, unitMax: unitId};
          return merge(defaultState, state, nextState);
        } else {
          return merge(defaultState);
        }
      case "RECEIVE_UNITS":
      console.log(action);
        lessonId = action.units.progress.lessonId;
        unitId = action.units.progress.unitId;
        maxUnit = action.units.progress.maxUnit;
        nextState = {lessonMax: lessonId, unitMax: unitId,
          maxUnit: maxUnit};
        return merge(defaultState, state, nextState);
      default:
        return merge(state);
    }
  };

  export default ProgressReducer;
