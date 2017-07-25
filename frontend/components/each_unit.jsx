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

          {this.props.unit}

        </div>
        </Link>
      </li>
    );
  }
}

export default EachUnit;
