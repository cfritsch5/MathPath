import merge from 'lodash/merge';

const QuestionsReducer = (state = {}, action) => {
  Object.freeze(state);


  switch(action.type){

    case "RECEIVE_LESSON":
      const newQuestions = action.lesson.questions;
      return merge({}, newQuestions);

    default:
      return state;
  }
};

export default QuestionsReducer;
