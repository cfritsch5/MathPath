import React from 'react';
import { Link } from 'react-router-dom';
// import SkillTreeContainer from './skilltree_container';

export const sessionLinks = () => (
  <nav className="login-signup">
    <Link to="/login">Login</Link>
    <Link to="/signup">Sign Up</Link>
  </nav>
);

const LoginBox = ({ currentUser, logout }) => (
  currentUser ? null : sessionLinks());

export default LoginBox;
