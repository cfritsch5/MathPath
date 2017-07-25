import React from 'react';

class Lesson extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      name: ""
    };
  }

  componentDidMount() {
    this.props.requestLesson(this.props.match.params.lessonId);
  }

  componentWillReceiveProps(nextprops) {
    console.log("nextprops",nextprops);
    let id = this.props.match.params.lessonId;
      this.setState({name: nextprops.lessons[id].name});
  }

  render() {

    let questions = this.props.lessons.questions ||
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
