import React from 'react';
import SkillTreeContainer from '../skilltree/skill_tree';
import LoginContainer from '../auth/login_box_container';
import SessionFormContainer from '../auth/session_form_container';
import { AuthRoute, ProtectedRoute } from '../../util/route_util';
import TagLine from '../main/tagline';

import {
  Route,
  Redirect,
  Switch,
  Link
} from 'react-router-dom';
//
// const Home = ({ currentUser, logout }) => (
//   currentUser ? <Redirect to="/skilltree" /> : <LoginContainer />
// );
const Home = ({ currentUser, logout }) => {
  if (currentUser){
    return <Redirect to="/skilltree" />;
  } else {
    return (
      <div className="home-component">
        <TagLine />
        <div>
          <Switch>
            <Route exact path="/" component={LoginContainer} />
            <AuthRoute exact path="/login" component={SessionFormContainer} />
            <AuthRoute exact path="/signup" component={SessionFormContainer} />
          </Switch>
        </div>
      </div>
  );
  }
};

export default Home;
