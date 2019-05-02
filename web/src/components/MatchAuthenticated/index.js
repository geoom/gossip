// @flow
import React from 'react';
import { Route, Redirect } from 'react-router-dom';

type Props = {
  path: string,
  exact?: any,
  component: any,
  isAuthenticated: boolean,
  willAuthenticate: boolean,
}

const MatchAuthenticated = ({ 
  path,
  exact,
  isAuthenticated,
  willAuthenticate,
  component: Component
}: Props) => (
    <Route 
      exact={exact}
      path={path}
      render={ props => { 
        if (isAuthenticated) { return <Component {...props} />; }
        if (willAuthenticate) { return null; }
        if (!willAuthenticate && !isAuthenticated) { return <Redirect to={{ pathname: '/login' }} />; }
        return null;
      }} 
    />
);

export default MatchAuthenticated;
