import merge from 'lodash/merge';

const LessonsReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState;

  switch(action.type){
    case "RECEIVE_LESSONS":
      nextState = {};
      // debugger;
      action.lessons.forEach(lesson => (nextState[lesson.id] = lesson));
      return nextState;
    case "RECEIVE_LESSON":
      const newLesson = action.lesson.lesson;
      // console.log("lesson reducer action.lesson", action.lesson);
      // debugger;
      return merge({}, state, newLesson);
      case "RECEIVE_UNIT":
      const newLessons = action.unit.lessons;
      return Object.assign({}, newLessons);
    default:
      return state;
  }
};

export default LessonsReducer;
