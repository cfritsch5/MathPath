import { connect } from 'react-redux';
import Lesson from './lesson';
import {fetchLesson} from '../../actions/lesson_actions';

const mapStateToProps = state => ({
  lessons: state.lessons,
  errors: state.errors,
  test: "test props"
});

const mapDispatchToProps = dispatch => ({
  requestLesson: (id) => dispatch(fetchLesson(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Lesson);
