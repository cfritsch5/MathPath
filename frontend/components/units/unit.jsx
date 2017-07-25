import React from 'react';
import { Link } from 'react-router-dom';

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

    let lessons = this.props.units.lessons || ["no lessons to show"];
    const lessonLi = Object.keys(lessons).map((id)=>(
      <Link to={`/lessons/${lessons[id].id}`}>
        <li key={id}>{lessons[id].name}</li>
      </Link>
    ));
    return(<div className={`show-unit`}>
      <h1>unit: {this.state.name}</h1>
        <ul>
          {lessonLi}
        </ul>
    </div>);
  }
}

export default Unit;
