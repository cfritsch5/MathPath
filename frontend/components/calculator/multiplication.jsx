import React from 'react';
import Number from './number';

class Multiplication extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      numbers: 0,
      input:'',
      test: "unchanged",
      objects:[]
    };

    this.test = this.test.bind(this);
    this.update = this.update.bind(this);
  }

  test() {
    let key = this.state.numbers;
    this.setState({numbers: this.state.numbers+1});
    this.setState({objects: this.state.objects.concat([<Number key={key} num={this.state.input}/>])});

  }

  update(e){
    // e.preventDefault();
    this.setState({input: e.currentTarget.value});
  }



  render(){
    let test = this.state.test;
    let objects = this.state.objects;
    return (
    <div>
      <input type="text" value={this.state.input} onChange={this.update}/>
      <button onClick={this.test}/>
      <h1>Multiplication</h1>
      {test}
      {objects}
    </div>
  );
  }
}

export default Multiplication;
