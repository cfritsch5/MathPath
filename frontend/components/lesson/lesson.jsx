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
        console.log("state",this.state);
        const correct = this.state.correct.map((el,idx)=>(
          <li key={idx}>
            {idx+1}:{el}
          </li>
        ));
        return (
          <div>
            <h1>Good Job</h1>
            {correct}
          </div>
        );
      } else {
        return false;
      }
    }

    render () {
      let done;
      let showContainer;
      if (this.state.lessonId) { //proxy for basically an is loaded thing
        done = this.done();

        if(done){
          showContainer = done;
        } else {
          showContainer = <QuestionContainer/>;
        }
      }

      return (
        <div className="lesson-container">
          <h1>lesson container</h1>
          {showContainer}
        </div>
      );
    }
}
export default Lesson;
