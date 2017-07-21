import React from 'react';
import { Provider } from 'react-redux';
import {
  Route,
  Redirect,
  Switch,
  Link,
  HashRouter
} from 'react-router-dom';

import GreetingContainer from './greeting_container';
import LoginContainer from './login_box_container';
import SessionFormContainer from './session_form_container';
import { AuthRoute, ProtectedRoute } from '../util/route_util';
import SkillTreeContainer from './skilltree_container';

const App = () => (
  <div>
    <header>
      <Link to="/" className="header-link">
        <h1>MathPath</h1>
      </Link>
      <ProtectedRoute exact path="/" component={GreetingContainer} />
    </header>
    <Switch>
      <AuthRoute exact path="/" component={LoginContainer} />
      <AuthRoute path="/login" component={SessionFormContainer} />
      <AuthRoute path="/signup" component={SessionFormContainer} />
    </Switch>
    <ProtectedRoute exact path="/" component={SkillTreeContainer} />
  </div>
);


export default App;
