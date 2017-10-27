import React from 'react';
import UnitContainer from '../units/unit_container';
import SkillTreeContainer from './skilltree_container';

import { AuthRoute, ProtectedRoute } from '../../util/route_util';

import {
  Route,
  Redirect,
  Switch,
  Link
} from 'react-router-dom';

class Stats extends React.Component {
  constructor(props){
    super(props);
  }

  render(){
    return (
      <div className="switch-stats">
        <div className="stats">
        <img src="assets/blueowl.jpg" />
        <h2>{this.props.currentUser.username}</h2>
        <h3> {this.props.progress.lessonMax - 2} Lessons Completed!</h3>
        <h3> {this.props.progress.unitMax - 2} Units Completed!</h3>
        <h3> 0 Days Practiced</h3>
      </div>
      </div>
    );
  }
}

export default Stats;
