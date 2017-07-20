import React from 'react';
import { Link, withRouter } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      password: ''
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentWillReceiveProps(nextProps) {
    if (nextProps.loggedIn) {
      this.props.history.push('/');
    }
  }

  update(field) {
    return e => this.setState({
      [field]: e.currentTarget.value
    });
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = this.state;
    this.props.processForm({user});
  }

  navLink() {
    let login = "Login", signup = "Sign Up";
    if (this.props.formType === 'login') {
      return (<div className="signup-v-login">
        <input type="submit" value={login} />
        <Link to="/signup">{signup} instead</Link>
      </div>
    );
    } else {
      return(<div className="signup-v-login">
        <input type="submit" value={signup} />
        <Link to="/login">{login} instead</Link>
       </div>
     );
    }
  }

  renderErrors() {
    return(
      <ul>
        {this.props.errors.map((error, i) => (
          <li key={`error-${i}`}>
            {error}
          </li>
        ))}
      </ul>
    );
  }

  render() {
    return (
      <div className="login-form-container">
        <form onSubmit={this.handleSubmit} className="login-form-box">
          {this.renderErrors()}
          <div className="login-form-item">
              <input type="text"
                value={this.state.username}
                placeholder='Username'
                onChange={this.update('username')}
                className="login-input"
              />
          </div>
          <div className="login-form-item">
              <input type="password"
                value={this.state.password}
                placeholder='Password'
                onChange={this.update('password')}
                className="login-input"
              />
            </div>
            {this.navLink()}
        </form>
      </div>
    );
  }
}

export default withRouter(SessionForm);
