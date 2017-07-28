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
  }

  componentWillReceiveProps(nextprops) {
      this.setState({name: nextprops.currentUnit.name});
  }

  render() {

    let lessons = this.props.lessons || ["no lessons to show"];
    const lessonLi = Object.keys(lessons).map((id)=>{
      if (this.props.progress.lessonMax >= id){
        return (<Link to={`/lessons/${lessons[id].id}`} key={id}>
            <li key={id}>
              <p> I AM A LINK!!!!</p>
                {lessons[id].name}
            </li>
          </Link>
        );
      } else {
        return (
          <li key={id}>
            <p>I SHOULD NOT BE A LINK</p>
              {lessons[id].name}
          </li>
      );
      }


    });

    return(<div className={`show-unit`}>
      <h1>unit: {this.state.name}</h1>
        <ul>
          {lessonLi}
        </ul>
    </div>);
  }
}

export default Unit;
