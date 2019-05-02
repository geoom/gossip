import { reset } from 'redux-form';
import api from '../api';

function setCurrentUser(dispatch, response) {
  localStorage.setItem('token', JSON.stringify(response.meta.auth_token));
  dispatch({ type: 'AUTHENTICATION_SUCCESS', response });
}

export function login(data, router) {
  return dispatch => api.post('/auth/login', data)
    .then((response) => {
      setCurrentUser(dispatch, response);
      dispatch(reset('login'));
      router.transitionTo('/');
    });
}

export function signup(data, router) {
  return dispatch => api.post('/signup', data)
    .then((response) => {
      setCurrentUser(dispatch, response);
      dispatch(reset('signup'));
      router.transitionTo('/');
    });
}

export function logout(router) {
  return dispatch => api.delete('/auth')
      .then(() => {
        localStorage.removeItem('token');
        dispatch({ type: 'LOGOUT' });
        router.transitionTo('/login');
      });
}


export function authenticate() {
  return (dispatch) => {
    dispatch({ type: 'AUTHENTICATION_REQUEST' });
    return api.post('/auth/refresh')
        .then((response) => {
          setCurrentUser(dispatch, response);
        })
        .catch(() => {
          localStorage.removeItem('token');
          window.location = '/login';
        });
  };
}

export const unauthenticate = () => ({ type: 'AUTHENTICATION_FAILURE' });
