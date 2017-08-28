import merge from 'lodash/merge';

const UnitsReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState;

  switch(action.type){
    case "RECEIVE_UNITS":
      nextState = {};
      action.units.units.forEach(unit => (nextState[unit.id] = unit));
      return nextState;
    case "RECEIVE_UNIT":
    console.log("unitstate",state);
    console.log(action);
      const newUnit = action.unit.unit;
      return merge({}, state, newUnit);
    default:
      return state;
  }
};

export default UnitsReducer;
