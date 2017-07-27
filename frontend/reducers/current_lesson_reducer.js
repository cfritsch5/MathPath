import merge from 'lodash/merge';

const CurrentLessonReducer = (state = {}, action) => {
  Object.freeze(state);

  let nextState = {
    lessonId: 1,
    idx: 0,
    keys: [],
    correct: [],
    lessonMax: 1,
    unitMax: 1
  };


    switch(action.type){
      case "RECEIVE_LESSON":
        const newQuestions = action.lesson.questions;
        let lessonId = parseInt(Object.keys(action.lesson.lesson));
        let keys = Object.keys(newQuestions).map((key)=>parseInt(key));
        return merge( nextState, {keys: keys, lessonId: lessonId});

      case "UPDATE_CURRENT_LESSON":
      console.log("state from current lesson", state);
        const currentLesson = { lessonId: (action.currentLesson + 1) };
        return merge(nextState, state, currentLesson);

      case "NEXT_QUESTION":
      let idx = state.idx + 1;
      let correct = state.correct;
      correct.push(action.returnAns);
      // console.log("corr, act, st",correct, action, state);
      return merge( nextState, state, {correct: correct, idx: idx});

      default:
        return state;
    }
  };

  export default CurrentLessonReducer;
