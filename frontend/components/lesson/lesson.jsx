import React from 'react';

class Lesson extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      name: ""
    };
  }

  componentDidMount() {
    this.props.requestUnit(this.props.match.params.lessonId);
    console.log(this.props.match.params.lessonId);
  }

  componentWillReceiveProps(nextprops) {
    console.log(nextprops);
      this.setState({name: nextprops.lesson.name});
  }

  render() {

    let questions = this.props.lessons.questions ||
      ["tester question1", "tester question2"];
    const questionsLi = Object.keys(questions).map((id)=>(
      <li key={id}>{questions[id].name}</li>));
    return(<div className={`show-unit`}>
      <h1>unit: {this.state.name}</h1>
      <ul>
        {questionsLi}
      </ul>
    </div>);
  }
}

export default Lesson;
