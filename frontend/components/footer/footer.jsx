import React from 'react';

const Footer = () => (
  <footer>
    <div>
      <h3>Made By </h3><h2>Casey Fritsch</h2>
    </div>
          <ul>
            <li>
              <a href="https://github.com/cfritsch5/mathpath" alt="github link">
                <img className="logo" src="./assets/github.png"/>
              </a>
            </li>
            <li>
              <a href="https://www.linkedin.com/in/casey-fritsch" alt ="linkedin link">
                <img className="logo" src="./assets/linkedin.png"/>
              </a>
            </li>
            <li>
              <a href="http://www.caseyfritsch.com" alt ="portfolio link">
                <img className="logo" src="./assets/homeicon.png"/>
              </a>
            </li>
          </ul>

  </footer>
);

export default Footer;
