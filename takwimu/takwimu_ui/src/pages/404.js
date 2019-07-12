import React from 'react';
import PropTypes from 'prop-types';

import { withStyles, Typography } from '@material-ui/core';

import Error from '../components/Error';
import ErrorPage from '../components/ErrorPage';

const styles = () => ({
  root: {
    marginBottom: '14.375rem'
  }
});

function NotFoundError({ classes }) {
  return (
    <ErrorPage classes={{ root: classes.root }}>
      <Error title="404 - Page Not Found">
        <Typography variant="body1">
          The page you are looking for does not exist.
        </Typography>
      </Error>
    </ErrorPage>
  );
}

NotFoundError.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(NotFoundError);
