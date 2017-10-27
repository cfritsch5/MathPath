import { connect } from 'react-redux';
import { Route, Redirect, withRouter } from 'react-router-dom';
import Stats from './stats';

const mapStateToProps = state => ({
  currentUser: state.session.currentUser,
  progress: state.progress,
  units: state.units,
});

const mapDispatchToProps = dispatch => ({
});

export default withRouter(connect(
  mapStateToProps,
  mapDispatchToProps
)(Stats));
