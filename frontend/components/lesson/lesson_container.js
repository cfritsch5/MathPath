import { connect } from 'react-redux';
import SkillTree from '../skilltree/skill_tree';

// Actions
import {fetchLesson} from '../actions/units_actions';

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
)(SkillTree);
