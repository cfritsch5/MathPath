import React from 'react';
import { Link } from 'react-router-dom';

export const sessionLinks = () => (
  <nav className="login-signup">
    <Link to="/login">Login</Link>
    <Link to="/signup">Sign Up</Link>
  </nav>
);

const LoginBox = ({ currentUser }) => (
  currentUser ? null : sessionLinks());

export default LoginBox;
