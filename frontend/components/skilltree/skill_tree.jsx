import React from 'react';
import EachUnit from '../units/each_unit';

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
    const unitItems = Object.keys(units).map((id)=>(
      <EachUnit  key={ id } id={id} unit={ units[id].name }/>
    )) || ["not rendered yet"];


    return(<div className="skill-tree">
      <ul className="unit-index">
        {unitItems}
      </ul>
    </div>);
  }
}

export default SkillTree;
