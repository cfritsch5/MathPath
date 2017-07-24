import { combineReducers } from 'redux';
import SessionReducer from './session_reducer';
import UnitsReducer from './units_reducer';
import LessonsReducer from './lessons_reducer';

const RootReducer = combineReducers({
  session: SessionReducer,
  units: UnitsReducer,
  lessons: LessonsReducer
});

export default RootReducer;
