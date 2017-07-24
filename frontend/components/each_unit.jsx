import React from 'react';
import merge from 'lodash/merge';
import { Link } from 'react-router-dom';

class EachUnit extends React.Component {
  constructor(props) {
    super(props);
    // this.state = { detail: false };
    // this.toggleDetail = this.toggleDetail.bind(this);
    // this.toggleTodo = this.toggleTodo.bind(this);
  }

  // toggleDetail(e) {
  //   e.preventDefault();
  //   this.setState({
  //     detail: !this.state.detail
  //   });
  // }
  //
  // toggleTodo(e) {
  //   e.preventDefault();
  //   const toggledTodo = merge({}, this.props.todo, {
  //      done: !this.props.todo.done
  //    });
  //    this.props.updateTodo(toggledTodo);
  // }

  render() {
    // const { todo , updateTodo } = this.props;
    // const { title, done } = todo;
    // let detail;
    // if (this.state.detail) {
    //   detail = <TodoDetailViewContainer todo={todo} />;
    // }
    console.log(this.props);
    return (

      <li>
        <Link to={`/units/${this.props.id}`} >
        <div className="each-unit">

          {this.props.unit}

        </div>
        </Link>
      </li>
    );
  }
}

export default EachUnit;
