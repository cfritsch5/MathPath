import React from 'react';
import { Link } from 'react-router-dom';

const LoginBox = ({ currentUser }) => (
  currentUser ? null : sessionLinks());

export const sessionLinks = () => (
  <div className="splash-page-login">
    <div className="get-started">
      <Link to="/signup">Lets Get Started</Link>
    </div>
  </div>
);

export default LoginBox;
