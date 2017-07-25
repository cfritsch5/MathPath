import { connect } from 'react-redux';
import Unit from './unit';

// Actions
import {fetchUnit} from '../actions/units_actions';
import {fetchLessons} from '../actions/lesson_actions';

const mapStateToProps = state => ({
  units: state.units,
  lessons: state.lessons,
  errors: state.errors,
});

const mapDispatchToProps = dispatch => ({
  requestUnit: (id) => dispatch(fetchUnit(id)),
  requestLessons: () => dispatch(fetchLessons())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Unit);
