import { connect } from 'react-redux';
import Question from './question';
import { nextQuestion } from '../../actions/question_actions';

const mapStateToProps = (state, ownprops) => {
  // console.log("quest cont state",state);
    let {keys, idx} = state.currentLesson;
    return {
    question: state.questions[keys[idx]],
    idx: idx,
    errors: state.errors,
    test: "test props from question container"
  };
};

const mapDispatchToProps = dispatch => ({
  nextQuestion: (returnAns) => dispatch(nextQuestion(returnAns))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Question);
