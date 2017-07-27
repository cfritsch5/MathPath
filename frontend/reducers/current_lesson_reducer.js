import merge from 'lodash/merge';

const CurrentLessonReducer = (state = {}, action) => {
  Object.freeze(state);

  let nextState = {
    lessonId: 0,
    idx: 0,
    keys: [],
    correct: []
  };


    switch(action.type){
      case "RECEIVE_LESSON":
        const newQuestions = action.lesson.questions;
        let lessonId = parseInt(Object.keys(action.lesson.lesson));
        // console.log("currlesred", action.lesson);
        let keys = Object.keys(newQuestions).map((key)=>parseInt(key));
        return merge( nextState, {keys: keys, lessonId: lessonId});

      case "UPDATE_CURRENT_LESSON":
        const currentLesson = { lessonId: action.currentLesson };
        return merge(nextState, currentLesson);

      case "NEXT_QUESTION":
      // console.log("next question");
      // console.log("state", state);
      let idx = state.idx + 1;
      let correct = state.correct;
      correct.push(action.returnAns);
      console.log("corr, act, st",correct, action, state);
      return merge( nextState, state, {correct: correct, idx: idx});

      default:
        return state;
    }
  };

  export default CurrentLessonReducer;
