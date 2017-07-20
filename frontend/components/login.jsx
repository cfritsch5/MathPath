import React from 'react';
import { Link } from 'react-router-dom';

export const sessionLinks = () => (
  <nav className="login-signup">
    <Link to="/login">Login</Link>
    <Link to="/signup">Sign up!</Link>
  </nav>
);

const LoginBox = ({ currentUser, logout }) => (
  currentUser ? null : sessionLinks()
);

export default LoginBox;
