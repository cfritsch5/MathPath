import { connect } from 'react-redux';
import Lesson from './lesson';
import {fetchLesson, updateCurrentLesson} from '../../actions/lesson_actions';
import { Route, Redirect, withRouter } from 'react-router-dom';

const mapStateToProps = (state,ownprops) => ({
  lesson: state.lessons[ownprops.match.params.lessonId] || {name:""},
  currentLesson: state.currentLesson,
  questions: state.questions,
  errors: state.errors,
  test: "test props from lesson container"
});

const mapDispatchToProps = dispatch => ({
  requestLesson: (id) => dispatch(fetchLesson(id)),
  updateCurrentLesson: (id) => dispatch(updateCurrentLesson(id))
});

export default withRouter(connect(
  mapStateToProps,
  mapDispatchToProps
)(Lesson));
