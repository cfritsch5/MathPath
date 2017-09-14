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
      let current;
      if (this.props.progress.lessonMax == id) {
        current = "current";
      } else {
        current = "not-current";
      }
      if (this.props.progress.lessonMax >= id){
        return (<Link to={`/lessons/${lessons[id].id}`} key={id}>
            <li key={id} className={`unlocked-lesson ${current}`}>
                <h4>{lessons[id].name}</h4>
            </li>
          </Link>
        );
      } else {
        return (
          <li key={id} className="locked-lesson">
              <h4>{lessons[id].name}</h4>
          </li>
      );
      }


    });

    let unit = this.props.currentUnit;

    return(
      <div className="unit-main">
        <Link to={`/skilltree`}>
          <div className="unit-nav">
            Back
          </div>
        </Link>
        <div className={`show-unit`}>
          <h1>{this.state.name}</h1>
          <ul>
            {lessonLi}
          </ul>
        </div>
      </div>
  );
  }
}

export default Unit;
