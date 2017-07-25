import React from 'react';
// // Components
import EachUnit from '../units/each_unit';
// import UnitForm from './unit_form';

class SkillTree extends React.Component {
  constructor(props){
    super(props);
    // console.log("skill tree constructor props:",this.props);
    // console.log("skill tree constructor state:",this.state);
  }

  componentDidMount() {
    // console.log("will mount:",this.props);
    this.props.requestUnits();
  }

  componentWillReceiveProps(nextprops) {
    // console.log("will receive props:",this.props, nextprops);

  }


  render() {
    // const { units } = this.props;
    // console.log("skilltree render props:",this.props);
    let units = this.props.units || [];
    const unitItems = Object.keys(units).map((id)=>(<EachUnit  key={ id } id={id} unit={ units[id].name } />)) || ["not rendered yet"];


    return(<div className="skill-tree">
    <p>Skill tree component</p>
      <ul className="unit-index">
        {unitItems}
      </ul>
    </div>);
  }
}

export default SkillTree;
