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
import HomeContainer from './home_container';
import UnitContainer from './unit_container';

const showUnit = (props) => (<h1>show unit page {props.match.params.unitId}</h1>);

const App = () => (
  <div>
    <header>
      <Link to="/" className="header-link">
        <h1>MathPath</h1>
        <ProtectedRoute path="/" component={GreetingContainer} />
      </Link>
    </header>
    <Switch>
      <Route exact path="/" component={HomeContainer} />
      <ProtectedRoute exact path="/skilltree" component={SkillTreeContainer} />
      <AuthRoute path="/login" component={SessionFormContainer} />
      <AuthRoute path="/signup" component={SessionFormContainer} />
      <ProtectedRoute path="/units/:unitId" component={UnitContainer} />
    </Switch>
  </div>
);


export default App;
