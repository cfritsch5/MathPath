import React from 'react';
import { Link } from 'react-router-dom';

const Header = (currentUser, logout) => (
	<div className="greeting">
    <h2 className="header-name">{currentUser.username}</h2>
    <button className="greeting-button" onClick={logout}>Log Out</button>
	</div>
);

const Greeting = ({ currentUser, logout }) => (
  currentUser ? (Header(currentUser, logout)) : <div className="greeting"><Link className="greeting-button" to="/login">Login</Link></div>
);

export default Greeting;
