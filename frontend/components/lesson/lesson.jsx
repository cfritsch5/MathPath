import React from 'react';
import { Link } from 'react-router-dom';
import QuestionContainer from './question_container';



class Lesson extends React.Component {
  constructor(props){
    super(props);

    this.state = {};

    this.redirect = this.redirect.bind(this);
    this.done = this.done.bind(this);
  }

  componentDidMount() {
    this.props.requestLesson(this.props.match.params.lessonId);
  }

  componentWillReceiveProps(nextprops) {
    this.setState(nextprops.currentLesson);
  }

    done() {
      if (this.state.idx >= this.state.keys.length) {
        let correct = this.state.correct;
        let numCorrect = 0;
        for(let i = 0 ; i < correct.length ; i++){
          if (correct[i]=== "true"){
            numCorrect++;
          }
        }
        const Correct = this.state.correct.map((el,idx)=>{
          let check;
          if (el === "true"){
            check = <p className="check">✔</p>;
          } else {
            check = <p className="x">✘</p>;
          }
          return (<li className="correct-li" key={idx}>
              <p>  {idx+1} )</p> {check}
            </li>);
        });
        return (
          <div className="question-container">
            <h3>Good Job</h3>
            <h5>Total: {numCorrect}</h5>
            <ul className="done-ul">
              {Correct}
            </ul>
            <button onClick={this.redirect}>Continue</button>
          </div>
        );
      } else {
        return false;
      }
    }

    redirect(e){
      e.preventDefault();
      this.props.updateLesson(this.props.userId, this.state.lessonId).then(
        this.props.history.goBack
      );
    }

    render () {
      let done;
      let showContainer;
      if (this.state.lessonId) { //proxy for basically an onloaded thing
        done = this.done();

        if(done){
          showContainer = done;
        } else {
          showContainer = <QuestionContainer/>;
        }
      }

      return (
        <div className="lesson-container">
          {showContainer}
        </div>
      );
    }
}
export default Lesson;
