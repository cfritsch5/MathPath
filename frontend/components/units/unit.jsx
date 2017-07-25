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
    // console.log(this.props.match.params.unitId);
  }

  componentWillReceiveProps(nextprops) {
    console.log("nextprops",nextprops);
      this.setState({name: nextprops.currentUnit.name});
  }

  render() {

    let lessons = this.props.lessons || ["no lessons to show"];
    const lessonLi = Object.keys(lessons).map((id)=>(
        <li key={id}>
          <Link to={`/lessons/${lessons[id].id}`}>
            {lessons[id].name}
          </Link>
        </li>
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
