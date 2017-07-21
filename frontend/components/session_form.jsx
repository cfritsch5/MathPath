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
    this.signInAsGuest = this.signInAsGuest.bind(this);
  }

  update(field) {
    return e => this.setState({
      [field]: e.currentTarget.value
    });
  }

  signInAsGuest (e) {
  e.preventDefault();
  this.setState({
    username: "guest",
    password: "password"
  });
  const user = {
    username: "guest",
    password: "password"
  };
  setTimeout(this.props.processForm({user}),500);
}

  handleSubmit(e) {
    console.log(this.state);
    e.preventDefault();
    const user = this.state;
    this.props.processForm({user});
  }

  navLink() {
    let login = "Login", signup = "Sign Up";
    if (this.props.formType === 'login') {
      return (<div className="signup-v-login">
        <input type="submit" value={login} />
        <input className="signup-v-login" onClick={this.signInAsGuest} type="submit" value="guest"/>
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
