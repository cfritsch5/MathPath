import { connect } from 'react-redux';

import { logout } from '../actions/session_actions';
import LoginBox from './login';

const mapStateToProps = ({ session }) => ({
  currentUser: session.currentUser
});

const mapDispatchToProps = (dispatch,{location}) => {
  const path = location.pathname.slice(1);
  return ({
    logout: () => dispatch(logout()),
    path
  });
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(LoginBox);
