import React from 'react';
import { Link } from 'react-router-dom';
import Multiplication from './multiplication';


class Calculator extends React.Component {
  constructor(props){
    super(props);

    this.state = {};
  }


    render () {

      return (
        <div className="calculator-container">
          <h1>calculator class</h1>
          <Multiplication />
        </div>
      );
    }
}
export default Calculator;
