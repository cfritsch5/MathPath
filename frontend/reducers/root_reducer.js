import { combineReducers } from 'redux';
import SessionReducer from './session_reducer';
import UnitsReducer from './units_reducer';
import LessonsReducer from './lessons_reducer';
import QuestionsReducer from './question_reducer';
import CurrentLessonReducer from './current_lesson_reducer';

const RootReducer = combineReducers({
  session: SessionReducer,
  units: UnitsReducer,
  lessons: LessonsReducer,
  questions: QuestionsReducer,
  currentLesson: CurrentLessonReducer
});

export default RootReducer;
