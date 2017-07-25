import { connect } from 'react-redux';
import SkillTree from './skill_tree';

// Actions
import {fetchUnits} from '../../actions/units_actions';

const mapStateToProps = state => ({
  units: state.units,
  errors: state.errors,
  test: "test props"
});

const mapDispatchToProps = dispatch => ({
  requestUnits: () => dispatch(fetchUnits()),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SkillTree);
