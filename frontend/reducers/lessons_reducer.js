import merge from 'lodash/merge';

const LessonsReducer = (state = {}, action) => {
  Object.freeze(state);
  // let nextState;
  let nextState = {
    allLessons: {},
    currentLesson: {
      idx: 0,
      correct: 0,
    }
  };

  switch(action.type){
    // case "RECEIVE_LESSONS":
    //   console.log("LessonsReducer-", action.type);
    //   nextState = {};
    //   action.lessons.forEach(lesson => (nextState[lesson.id] = lesson));
    //   return nextState;
    // case "RECEIVE_LESSON":
    //   const newLesson = action.lesson.lesson;
    //   return merge({}, state, newLesson);
    case "RECEIVE_UNIT":
      const newLessons = action.unit.lessons;
      return Object.assign({}, newLessons);
    // case "UPDATE_CURRENT_LESSON":
    // // console.log("Questionsreducer-", action.type);
    //   const currentQuestion = {currentLesson: action.currentLesson};
    //   return merge(nextState, state, currentQuestion);
    default:
      return state;
  }
};

export default LessonsReducer;
