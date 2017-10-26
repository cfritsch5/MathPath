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
// import LoginContainer from './auth/login_box_container';
import SessionFormContainer from './auth/session_form_container';
import { AuthRoute, ProtectedRoute } from '../util/route_util';
import SkillTreeContainer from './skilltree/skilltree_container';
import HomeContainer from './main/home_container';
import UnitContainer from './units/unit_container';
import LessonContainer from './lesson/lesson_container';
import Calculator from './calculator/calculator';

// const App = () => (
//   <div>
//     <h1>Calculator</h1>
//     <Calculator />
//   </div>
// );
const App = () => (
  <div>
    <header>

      <Link to="/" className="header-link">
        <div className="header-title">
        <h1>MathPath</h1>
          <img className="mathowl" src="assets/mathowl.png"></img>
        </div>
      </Link>

      <Route path="/" component={GreetingContainer} />
    </header>
    <div className="app--switch">
      <Switch>
        <Route exact path="/" component={HomeContainer} />
        <AuthRoute path="/login" component={HomeContainer} />
        <AuthRoute path="/signup" component={HomeContainer} />
        <ProtectedRoute exact path="/skilltree" component={SkillTreeContainer} />
        <ProtectedRoute path="/units/:unitId" component={UnitContainer} />
        <ProtectedRoute path="/lessons/:lessonId" component={LessonContainer} />
      </Switch>
    </div>
  </div>
);


export default App;
