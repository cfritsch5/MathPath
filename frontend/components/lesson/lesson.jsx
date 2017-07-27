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
