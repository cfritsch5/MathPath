import React from 'react';
import merge from 'lodash/merge';
import { Link } from 'react-router-dom';

class TagLine extends React.Component {

  render(){
    return (
      <div className="tagline">
        <h2 id="tagline">The fun and easy way to learn Math!</h2>
        <img src="assets/Mathematics-512.png"/>
      </div>
    );
  }
}

export default TagLine;
