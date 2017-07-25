import React from 'react';
import { Link } from 'react-router-dom';
import SkillTreeContainer from '../skilltree/skill_tree';
import LoginContainer from '../auth/login_box_container';
import { Route, Redirect, withRouter } from 'react-router-dom';

const Home = ({ currentUser, logout }) => (
  currentUser ? <Redirect to="/skilltree" /> : <LoginContainer />
);

export default Home;
