import React from 'react';
// // Components
// import UnitListItem from './unit_list_item';
// import UnitForm from './unit_form';

class SkillTree extends React.Component {
  
  componentDidMount() {
    this.props.requestUnits();
  }

  componentWillReceiveProps(){

  }

  render() {
    // const { units } = this.props;
    let units = this.props.units || [];
    const unitItems = Object.keys(units).map((id)=>(units[id].name)) || ["not rendered yet"];
    // return(
    //   <div>
    //     <ul className="unit-list">
    //       { unitItems }
    //     </ul>
    //   </div>
    // );

    return(<div>
      <h2>SkillTree</h2>
      {unitItems}
    </div>);
  }
}

export default SkillTree;
