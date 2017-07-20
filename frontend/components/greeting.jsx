import React from 'react';
import { Link } from 'react-router-dom';

const Header = (currentUser, logout) => (
	<hgroup className="header-group">
    <h2 className="header-name">Hi, {currentUser.username}!</h2>
    <button className="header-button" onClick={logout}>Log Out</button>
	</hgroup>
);

const Greeting = ({ currentUser, logout }) => (
  currentUser ? (<div className="greeting">{Header(currentUser, logout)}</div>) : null
);

export default Greeting;
