import React from 'react';

class Number extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      num: 0
    };
  }

  componentDidMount(){
    console.log("number update");
    this.setState({num: this.props.num});
  }

  render() {
    return (
      <div>
        <h1>Number</h1>
        <h1>{this.state.num}</h1>
      </div>
    );
  }
}
export default Number;
