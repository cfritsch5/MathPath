import { connect } from 'react-redux';
import Lesson from './lesson';
import {fetchLesson} from '../../actions/lesson_actions';

const mapStateToProps = (state,ownprops) => ({
  lesson: state.lessons[ownprops.match.params.lessonId] || {name:""},
  currentLesson: state.currentLesson,
  questions: state.questions,
  errors: state.errors,
  test: "test props from lesson container"
});

const mapDispatchToProps = dispatch => ({
  requestLesson: (id) => dispatch(fetchLesson(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Lesson);
