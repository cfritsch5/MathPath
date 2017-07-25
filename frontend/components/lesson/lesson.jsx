import React from 'react';

class Lesson extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      name: "",
      currentquestion: 0
    };
  }

  componentDidMount() {
    this.props.requestLesson(this.props.match.params.lessonId);
  }

  componentWillReceiveProps(nextprops) {
    console.log("nextprops",nextprops);
    let id = this.props.match.params.lessonId;
    this.setState({name: nextprops.currentlesson.name});
    // let question = nextprops.questions
    // this.setState({currentquestion: Object.key()})
  }

  render() {
    console.log("render state",this.state);
    console.log("render props",this.props);
    let questions = this.props.questions ||
      {1:{name:"tester question1"}, 2:{name:"tester question2"}};
    const questionsLi = Object.keys(questions).map((id)=>(
      <li key={id}>{questions[id].name}</li>));
    return(<div className={`show-unit`}>
      <h1>Lesson: {this.state.name}</h1>
      <ul>
        {questionsLi}
      </ul>
    </div>);
  }
}

export default Lesson;
