import React from 'react';
import PropTypes from 'prop-types';

import { withStyles, Link, Typography } from '@material-ui/core';

import Error from '../components/Error';
import ErrorPage from '../components/ErrorPage';

const styles = () => ({
  root: {
    marginBottom: '14.375rem'
  }
});

function ServerError({ classes }) {
  return (
    <ErrorPage classes={{ root: classes.root }}>
      <Error title="500 - Internal Server Error">
        <Typography variant="body1">
          We’re having some trouble processing your request. We’ve logged the
          error and will investigate. You can try again or if the issue
          persists, please <Link href="/contact">contact us</Link>
        </Typography>
      </Error>
    </ErrorPage>
  );
}

ServerError.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(ServerError);
