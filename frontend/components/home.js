import React from 'react';
import { Link } from 'react-router-dom';
import SkillTreeContainer from './skill_tree';
import LoginContainer from './login_box_container';
import { Route, Redirect, withRouter } from 'react-router-dom';


// const Header = (currentUser, logout) => (
// 	<hgroup className="header-group">
//     <h2 className="header-name">Hi, {currentUser.username}!</h2>
//     <button className="header-button" onClick={logout}>Log Out</button>
// 	</hgroup>
// );


const Home = ({ currentUser, logout }) => (
  currentUser ? <div><p>Home container logged in </p><Redirect to="/skilltree" /></div> : <div><p>Home Container not logged in</p> <LoginContainer /></div>
);

export default Home;
