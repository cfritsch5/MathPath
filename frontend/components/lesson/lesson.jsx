import React from 'react';
import QuestionContainer from './question_container';

class Lesson extends React.Component {
  constructor(props){
    super(props);

    this.state = {};
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
        const Correct = this.state.correct.map((el,idx)=>(
          <li className="correct-li" key={idx}>
          <p>  {idx+1}</p> - <p>{el}</p>
          </li>
        ));
        return (
          <div className="correct-component">
            <h3>Good Job</h3>
            <h5>Total: {numCorrect}</h5>
            {Correct}
          </div>
        );
      } else {
        return false;
      }
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
          <h4>lesson container</h4>
          {showContainer}
        </div>
      );
    }
}
export default Lesson;
