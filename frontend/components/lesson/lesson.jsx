import React from 'react';

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
        console.log("handleSubmit true block");
      } else {
        console.log("handleSubmit else block");
        this.setState({idx: (this.state.idx + 1)});
      }
    }

    done() {
      if (this.state.idx >= this.state.keys.length - 1) {
        return <h1>Good Job</h1>;
      } else {
        return "";
      }
    }

    render () {
      let {questions} = this.props;
      let {keys, idx} = this.state;

      let done = this.done();
      let question = questions[keys[idx]] || {name:""};

      return (
        <div className="Question">
          <h3>{question.name}</h3>
          {done}
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
