import React from 'react';
import merge from 'lodash/merge';
import { Link } from 'react-router-dom';

class EachUnit extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const id = parseInt(this.props.id);
    let current;
    if (this.props.progress.unitMax == id) {
      current = "current";
    } else {
      current ="not-current";
    }
    if (this.props.progress.unitMax >= id){
      return (

        <li>
          <Link to={`/units/${this.props.id}`} >
          <div className={`each-unit unlocked ${current} col`}>
            <h4>{this.props.unit}</h4>
          </div>
          </Link>
        </li>
      );
    } else {
      return (

        <li>
          <div className="each-unit locked">
            <h4>{this.props.unit}</h4>
          </div>
        </li>
      );
    }

  }
}

export default EachUnit;
