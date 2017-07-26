import React from 'react';
import Question from './question';

class Lesson extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      name: "",
      keys: [],
      idx: 0
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidMount() {
    this.props.requestLesson(this.props.match.params.lessonId);
  }

  componentWillReceiveProps(nextprops) {
    let keys = Object.keys(nextprops.questions).map((key)=>parseInt(key));

    this.setState({name: nextprops.currentlesson.name,
      keys: keys
    });
  }

    handleSubmit(e) {
      e.preventDefault();
      if (this.state.idx >= this.state.keys.length - 1){
        // console.log("handleSubmit true block");
      } else {
        // console.log("handleSubmit else block");
        this.setState({idx: (this.state.idx + 1)});
      }
    }

    done() {
      if (this.state.idx >= this.state.keys.length - 1) {
        return (
          <div>
            <h1>Good Job</h1>
          </div>
        );
      } else {
        return false;
      }
    }

    render () {
      let {questions} = this.props;
      let {keys, idx} = this.state;

      let done = this.done();
      let question = questions[keys[idx]] || {name:"", answers:{name:""}};
      let answers = Object.keys(question.answers).map((ansId)=>
        <li key={ansId}>
          {question.answers[ansId].name}
        </li>
      );
      let showContainer;
      if(done){
        showContainer = done;
      } else {
        showContainer = <Question />;
      }

      return (
        <div className="lesson-container">
          <h3>{question.name}</h3>
          {done}
          <ul>
            {answers}
          </ul>
          <button type="submit"
            onClick={this.handleSubmit}
            className="answer">
            Next Question
          </button>

        </div>
      );
    }
}
export default Lesson;
