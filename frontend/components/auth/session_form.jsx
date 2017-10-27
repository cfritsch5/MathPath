import React from 'react';
import { Link, withRouter } from 'react-router-dom';
import TagLine from '../main/tagline';
class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      password: ''
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.signInAsGuest = this.signInAsGuest.bind(this);
  }

  update(field) {
    return e => this.setState({
      [field]: e.currentTarget.value
    });
  }

  signInAsGuest (e) {
  e.preventDefault();
  const user = {
    username: "Guest",
    password: "password"
  };
  this.setState({user});
  setTimeout(this.props.processForm({user}),500);
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
      <div className="sess-buttons">
        <input type="submit" value={login} />
        <input className="signup-v-login" onClick={this.signInAsGuest} type="submit" value="Guest"/>
      </div>
        <Link to="/signup">{signup} Instead</Link>
      </div>
    );
    } else {
      return(<div className="signup-v-login">
      <div className="sess-buttons">
        <input type="submit" value={signup} />
      </div>
        <Link to="/login">{login} Instead</Link>
       </div>
     );
    }
  }

  renderErrors() {
    if (this.props.errors.length === 0){
      return;
    } else {
      return(
        <ul className="errors">
          {this.props.errors.map((error, i) => (
            <li key={`error-${i}`}>
              {error}
            </li>
          ))}
        </ul>
      );
    }
  }

  render() {
    return (
      <div className="session-form">
      <div className="login-form-container">
        <form onSubmit={this.handleSubmit} className="login-form-box">
          {this.renderErrors()}
          <div className="login-input-group">
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
          </div>
            {this.navLink()}
        </form>
      </div>
    </div>

    );
  }
}

export default withRouter(SessionForm);
