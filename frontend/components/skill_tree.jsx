import React from 'react';
// // Components
import EachUnit from './each_unit';
// import UnitForm from './unit_form';

class SkillTree extends React.Component {

  componentDidMount() {
    this.props.requestUnits();
  }


  render() {
    // const { units } = this.props;
    let units = this.props.units || [];
    const unitItems = Object.keys(units).map((id)=>(<EachUnit  key={ id } id={id} unit={ units[id].name } />)) || ["not rendered yet"];


    return(<div className="skill-tree">
      <ul className="unit-index">
        {unitItems}
      </ul>
    </div>);
  }
}

export default SkillTree;
