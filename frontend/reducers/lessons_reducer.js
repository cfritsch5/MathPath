import merge from 'lodash/merge';

const LessonsReducer = (state = {}, action) => {
  Object.freeze(state);

  switch(action.type){

    case "RECEIVE_UNIT":
      const newLessons = action.unit.lessons;
      return Object.assign({}, newLessons);

    default:
      return state;
  }
};

export default LessonsReducer;
