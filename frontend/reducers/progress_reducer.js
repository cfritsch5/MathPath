import merge from 'lodash/merge';

const ProgressReducer = (state = {}, action) => {
  Object.freeze(state);

  let nextState = {
    lessonMax: 1,
    unitMax: 1
  };


    switch(action.type){
      case "UPDATE_CURRENT_LESSON":
        const currentLesson = { lessonMax: action.data.lessonId};
        const currentUnit = { unitMax: action.data.unitId};
        return merge(nextState, state, currentLesson, currentUnit);
      default:
        return merge(nextState, state);
    }
  };

  export default ProgressReducer;
