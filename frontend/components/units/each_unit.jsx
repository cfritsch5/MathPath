import React from 'react';
import merge from 'lodash/merge';
import { Link } from 'react-router-dom';

class EachUnit extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (

      <li>
        <Link to={`/units/${this.props.id}`} >
        <div className="each-unit">
          <h4>{this.props.unit}</h4>
        </div>
        </Link>
      </li>
    );
  }
}

export default EachUnit;
