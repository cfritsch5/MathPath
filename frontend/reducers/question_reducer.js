import merge from 'lodash/merge';

const QuestionsReducer = (state = {}, action) => {
  Object.freeze(state);
  // let nextState ={
  //   allQuestions: {},
  //   keys: [],
  //   currentQuestion: 0
  // };

  switch(action.type){
    // case "RECEIVE_QUESTIONS":
    //   console.log("Questionseducer-", action.type);
    //   nextState = {};
    //   action.lessons.forEach(question =>
    // (nextState[question.id] = question));
    //   return nextState;
    // case "RECEIVE_QUESTION":
    // console.log("Questionseducer-", action.type);
    //   const newQuestion = action.question;
    //   return merge({}, state, newQuestion);
    case "RECEIVE_LESSON":
    // console.log("Questionseducer-", action.type);
      const newQuestions = action.lesson.questions;
      // let keys = Object.keys(newQuestions).map((key)=>parseInt(key));
      // console.log("QR: keys, newQ", keys, newQuestions);
      // return merge(
      //   nextState,
      //   {keys: keys},
      //   {newQuestions: newQuestions});
      return merge({}, newQuestions);
    // case "UPDATE_CURRENT_QUESTION":
    // // console.log("Questionsreducer-", action.type);
    //   const currentQuestion = {currentQuestion: action.currentQuestion};
    //   return merge(nextState, state, currentQuestion);
    default:
      return state;
  }
};

export default QuestionsReducer;
