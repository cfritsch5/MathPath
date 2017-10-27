import React from 'react';
import EachUnit from './each_unit';

class SkillTree extends React.Component {
  constructor(props){
    super(props);
  }

  componentDidMount() {
    this.props.requestUnits();
  }

  componentWillReceiveProps(nextprops) {
  }

  render() {
    let units = this.props.units || [];

    const unitItems = [];
    // Object.keys(units).forEach((id)=>(
    //   unitItems.push(<EachUnit
    //     key={ id }
    //     id={id}
    //     unit={ units[id].name }
    //     progress={this.props.progress}
    //     />)
    //   )) || ["not rendered yet"];

    const ids = Object.keys(units).map((id)=>id);
    console.log("IDAAAAA", ids);
    let levels =[];
    let level = [], id;
    for(let i = 0 ; i < ids.length ; i++){

      id = ids[i];
      level.push(<EachUnit
        key={ id }
        id={id}
        unit={ units[id].name }
        progress={this.props.progress}
        />);

      if ( i%2 === 0 ){
        levels.push(level);
        level = [];
      }
    }
    console.log(levels);
    let testme = levels.map(_level=><div className="level">{_level}</div>);
    return(<div className="skill-tree">
    <h1>Units: </h1>
      <ul className="unit-index">
        {unitItems}
        {testme}
      </ul>
    </div>);
  }
}

export default SkillTree;
