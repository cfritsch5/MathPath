import { connect } from 'react-redux';
import { Route, Redirect, withRouter } from 'react-router-dom';

import { logout } from '../../actions/session_actions';
import Greeting from './greeting';

const mapStateToProps = ({ session }) => ({
  currentUser: session.currentUser
});

const mapDispatchToProps = (dispatch,{location}) => {
  return ({
    logout: () => dispatch(logout()),
  });
};

export default withRouter(connect(
  mapStateToProps,
  mapDispatchToProps
)(Greeting));
