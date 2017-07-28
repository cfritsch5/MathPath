import { connect } from 'react-redux';
import Unit from './unit';
import {fetchUnit} from '../../actions/units_actions';
import {fetchLessons} from '../../actions/lesson_actions';
import {withRouter } from 'react-router-dom';

const mapStateToProps = (state, ownprops) => {
  return {
    progress: state.progress,
    currentUnit: state.units[ownprops.match.params.unitId] || {name:""},
    lessons: state.lessons,
    errors: state.errors,
  };
};

const mapDispatchToProps = dispatch => ({
  requestUnit: (id) => dispatch(fetchUnit(id)),
  requestLessons: () => dispatch(fetchLessons())
});

export default withRouter(connect(
  mapStateToProps,
  mapDispatchToProps
)(Unit));
