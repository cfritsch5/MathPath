import merge from 'lodash/merge';

const CurrentLessonReducer = (state = {}, action) => {
  Object.freeze(state);

  let nextState = {
    lessonId: 1,
    idx: 0,
    keys: [],
    correct: []
  };


    switch(action.type){
      case "RECEIVE_LESSON":
        const newQuestions = action.lesson.questions;
        let lessonId = parseInt(Object.keys(action.lesson.lesson));
        let keys = Object.keys(newQuestions).map((key)=>parseInt(key));
        return merge( nextState, {keys: keys, lessonId: lessonId});

      case "UPDATE_CURRENT_LESSON":
        const currentLesson = { lessonId: (action.data.LessonId) };
        return merge(nextState, state, currentLesson);

      case "NEXT_QUESTION":
      let idx = state.idx + 1;
      let correct = state.correct;
      correct.push(action.returnAns);
      return merge( nextState, state, {correct: correct, idx: idx});

      default:
        return state;
    }
  };

  export default CurrentLessonReducer;
