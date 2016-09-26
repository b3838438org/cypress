import React, { Component } from 'react'
import { Link } from 'react-router'
import { observer } from 'mobx-react'

@observer
class LoginMessage extends Component {
  render () {
    return (
      <div id='builds-list-page'>
        <div className="empty">
          <h4>You Need to Login</h4>
          <p>Aenean lacinia bibendum nulla sed consectetur.</p>
          <div>
            <Link
              className='btn btn-black'
              to='/login'
              >
              <i className='fa fa-sign-in'></i>{' '}
              Log In
            </Link>
          </div>
        </div>
      </div>
    )
  }
}

export default LoginMessage
