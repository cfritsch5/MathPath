import React from 'react';
import UnitContainer from '../units/unit_container';
import SkillTreeContainer from './skilltree_container';
import StatsContainer from './stats_container';
import { AuthRoute, ProtectedRoute } from '../../util/route_util';

import {
  Route,
  Redirect,
  Switch,
  Link
} from 'react-router-dom';

const SwitchComponent = () => {
    return (
      <div className="switch-component">
        <div className="switch-skilltree">
          <Switch>
            <ProtectedRoute exact path="/skilltree" component={SkillTreeContainer} />
            <ProtectedRoute path="/units/:unitId" component={UnitContainer} />
          </Switch>
        </div>
        <StatsContainer />
      </div>
    );
};

export default SwitchComponent;
