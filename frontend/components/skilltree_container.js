import { connect } from 'react-redux';
import SkillTree from './skilltree';

// Actions
import {fetchUnits} from '../actions/units_actions';

const mapStateToProps = state => ({
  units: state.units,
  errors: state.errors
});

const mapDispatchToProps = dispatch => ({
  requestUnits: () => dispatch(fetchUnits()),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SkillTree);
