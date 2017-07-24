import { connect } from 'react-redux';
import Unit from './unit';

// Actions
import {fetchUnit} from '../actions/units_actions';

const mapStateToProps = state => ({
  units: state.units,
  errors: state.errors,
});

const mapDispatchToProps = dispatch => ({
  requestUnit: (id) => dispatch(fetchUnit(id)),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Unit);
