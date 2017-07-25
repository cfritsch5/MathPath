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
    console.log(this.props.match.params.unitId);
  }

  componentWillReceiveProps(nextprops) {
    console.log(nextprops);
      this.setState({name: nextprops.units.name});
  }

  render() {

    let lessons = this.props.units.lessons || [];
    const lessonLi = Object.keys(lessons).map((id)=>(<li key={id}>{lessons[id].name}</li>));
    return(<div className={`show-unit`}>
      <h1>unit: {this.state.name}</h1>
      <ul>
        {lessonLi}
      </ul>
    </div>);
  }
}

export default Unit;
