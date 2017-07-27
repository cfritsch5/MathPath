import { connect } from 'react-redux';
import Lesson from './lesson';
import {fetchLesson, updateLesson} from '../../actions/lesson_actions';
import { Route, Redirect, withRouter } from 'react-router-dom';

const mapStateToProps = (state,ownprops) => ({
  lesson: state.lessons[ownprops.match.params.lessonId] || {name:""},
  userId: state.session.currentUser.id,
  currentLesson: state.currentLesson,
  questions: state.questions,
  errors: state.errors,
  test: "test props from lesson container"
});

const mapDispatchToProps = dispatch => ({
  requestLesson: (id) => dispatch(fetchLesson(id)),
  updateLesson: (userId, lessonId) => dispatch(updateLesson(userId, lessonId))
});

export default withRouter(connect(
  mapStateToProps,
  mapDispatchToProps
)(Lesson));
