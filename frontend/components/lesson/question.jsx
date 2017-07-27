import React from 'react';

class Question extends React.Component {
  constructor(props){
    super(props);

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.nextQuestion(e.currentTarget.value);
  }

  render() {
    let question = this.props.question || "ERROR question not loading";
    let answers = question.answers || {name:"", value:false};
    let answersLi = Object.keys(answers).map((id)=>
      <li key={id}>
        <button onClick={this.handleSubmit} value={answers[id].value}>
          <h2>{answers[id].name}</h2>
        </button>
      </li>
    );

    return (
      <div className="question-container">
        <h3>Question Container</h3>
        {question.name}
        <ul>
          {answersLi}
        </ul>
      </div>
    );
  }
}

export default Question;
