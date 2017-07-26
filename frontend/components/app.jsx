import React from 'react';
import { Provider } from 'react-redux';
import {
  Route,
  Redirect,
  Switch,
  Link,
  HashRouter
} from 'react-router-dom';

import GreetingContainer from './main/greeting_container';
import LoginContainer from './auth/login_box_container';
import SessionFormContainer from './auth/session_form_container';
import { AuthRoute, ProtectedRoute } from '../util/route_util';
import SkillTreeContainer from './skilltree/skilltree_container';
import HomeContainer from './main/home_container';
import UnitContainer from './units/unit_container';
import LessonContainer from './lesson/lesson_container';

const showUnit = (props) => (<h1>show unit page {props.match.params.unitId}</h1>);

const App = () => (
  <div>

    <header>

      <Link to="/" className="header-link">
        <div className="header-title">
        <h1>MathPath</h1>
        </div>
      </Link>

      <ProtectedRoute path="/" component={GreetingContainer} />
    </header>

    <Switch>
      <Route exact path="/" component={HomeContainer} />
      <AuthRoute path="/login" component={SessionFormContainer} />
      <AuthRoute path="/signup" component={SessionFormContainer} />
      <ProtectedRoute exact path="/skilltree" component={SkillTreeContainer} />
      <ProtectedRoute path="/units/:unitId" component={UnitContainer} />
      <ProtectedRoute path="/lessons/:lessonId" component={LessonContainer} />
    </Switch>

  </div>
);


export default App;
