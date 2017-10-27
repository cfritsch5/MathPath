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

    const ids = Object.keys(lessons).map((id)=>parseInt(id));

    let levels =[], level = [], id, current;

    for(let i = 0 ; i < ids.length ; i++){

      id = ids[i];
      if (this.props.progress.lessonMax === id) {
        current = "current";
      } else {
        current = "not-current";
      }

      if (this.props.progress.lessonMax >= id){
        level.push(
          <div className="star">
          <Link to={`/lessons/${lessons[id].id}`} key={id}>
            <li key={id} className={`unlocked ${current}`}></li>
          </Link>
          <h4>{lessons[id].name}</h4>
        </div>
        );
      } else {
        level.push(
          <div className="star">
            <li key={id} className="locked"></li>
            <h4>{lessons[id].name}</h4>
          </div>
      );
      }
      if(ids.length % 2 == 0){
        if ( (i + 1)%2 === 0){
          levels.push(level);
          level = [];
        }
      } else {
        if ( (i)%2 === 0){
          levels.push(level);
          level = [];
        }
      }
    }
    levels.push(level);
    let lessonLi = levels.map(_level=><div className="level">{_level}</div>);

    // let lessons = this.props.lessons || ["no lessons to show"];
    // const lessonLi = Object.keys(lessons).map((id)=>{
    //   let current;
    //   if (this.props.progress.lessonMax == id) {
    //     current = "current";
    //   } else {
    //     current = "not-current";
    //   }
    //   if (this.props.progress.lessonMax >= id){
    //     return (
    //       <div className="star">
    //       <Link to={`/lessons/${lessons[id].id}`} key={id}>
    //         <li key={id} className={`unlocked ${current}`}></li>
    //         <h4>{lessons[id].name}</h4>
    //       </Link>
    //     </div>
    //     );
    //   } else {
    //     return (
    //       <div className="star">
    //         <li key={id} className="locked"></li>
    //         <h4>{lessons[id].name}</h4>
    //       </div>
    //   );
    //   }
    //
    //
    // });

    let unit = this.props.currentUnit;

    return(
      <div className="unit-main">
        <Link to={`/skilltree`}>
          <div className="unit-nav">
            X
          </div>
        </Link>
        <div className={`show-unit`}>
          <h3>{this.state.name}</h3>
          <ul>
            {lessonLi}
          </ul>
        </div>
      </div>
  );
  }
}

export default Unit;
