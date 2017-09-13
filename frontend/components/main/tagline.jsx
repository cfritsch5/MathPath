import React from 'react';
import merge from 'lodash/merge';
import { Link } from 'react-router-dom';

class TagLine extends React.Component {

  render(){
    return (
      <div className="tagline">
        <h1 id="tagline">The fun and easy way to learn Math!</h1>
      </div>
    );
  }
}

export default TagLine;
