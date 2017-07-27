import merge from 'lodash/merge';

const UnitsReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState;

  switch(action.type){
    case "RECEIVE_UNITS":
    // console.log("Unitsseducer-", action.type);
      nextState = {};
      action.units.forEach(unit => (nextState[unit.id] = unit));
      return nextState;
    case "RECEIVE_UNIT":
    // console.log("Unitsseducer-", action.type);
      const newUnit = action.unit.unit;
      return merge({}, state, newUnit);
    default:
      return state;
  }
};

export default UnitsReducer;
