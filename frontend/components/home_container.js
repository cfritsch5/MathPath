import { connect } from 'react-redux';
import Home from './home';

const mapStateToProps = ({ session }) => ({
  currentUser: session.currentUser
});

const mapDispatchToProps = (dispatch,{location}) => {
  return ({});
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Home);
