import React from 'react';
class Unit extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      name: ""
    };
  }

  componentDidMount() {
    this.props.requestUnit(this.props.match.params.unitId);
  }

  componentWillReceiveProps(nextprops) {
    console.log("nextprops", nextprops);
      this.setState({name: nextprops.units[this.props.match.params.unitId].name});
  }

  render() {
    console.log("render state:", this.state);
    return(<div className={`show-unit`}>
      <h1>unit: {this.state.name}</h1>
    </div>);
  }
}

export default Unit;
