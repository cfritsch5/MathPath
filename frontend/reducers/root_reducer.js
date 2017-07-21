import { combineReducers } from 'redux';
import SessionReducer from './session_reducer';
import UnitsReducer from './units_reducer';

const RootReducer = combineReducers({
  session: SessionReducer,
  units: UnitsReducer
});

export default RootReducer;
