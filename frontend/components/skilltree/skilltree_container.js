import { connect } from 'react-redux';
import { Route, Redirect, withRouter } from 'react-router-dom';
import SkillTree from './skill_tree';

import {fetchUnits} from '../../actions/units_actions';

const mapStateToProps = state => ({
  progress: state.progress,
  units: state.units,
  errors: state.errors,
  test: "test props"
});

const mapDispatchToProps = dispatch => ({
  requestUnits: () => dispatch(fetchUnits()),
});

export default withRouter(connect(
  mapStateToProps,
  mapDispatchToProps
)(SkillTree));
