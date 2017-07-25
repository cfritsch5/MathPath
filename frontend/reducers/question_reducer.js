import merge from 'lodash/merge';

const QuestionsReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState;

  switch(action.type){
    case "RECEIVE_QUESTIONS":
      nextState = {};
      // debugger;
      action.lessons.forEach(question => (nextState[question.id] = question));
      return nextState;
    case "RECEIVE_QUESTION":
      const newQuestion = action.question;
      // debugger;
      return merge({}, state, newQuestion);
      case "RECEIVE_LESSON":
      const newQuestions = action.lesson.questions;
      // console.log("quesiton reducer state",state);
      // console.log("question reducer action.lesson.question",action.lesson.questions);
      return Object.assign({}, newQuestions) ;
    default:
      return state;
  }
};

export default QuestionsReducer;
