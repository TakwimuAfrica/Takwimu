import React from 'react';
import PropTypes from 'prop-types';

import { withStyles, Typography } from '@material-ui/core';

import Error from '../components/Error';
import ErrorPage from '../components/ErrorPage';
import { About } from '../components/Next';

const styles = () => ({
  root: {
    marginBottom: '14.375rem'
  }
});

function NotFoundError({
  classes,
  takwimu: {
    settings: { socialMedia }
  }
}) {
  return (
    <ErrorPage classes={{ root: classes.root }}>
      <Error title="404 - Page Not Found">
        <Typography variant="body1">
          The page you are looking for does not exist.
        </Typography>
      </Error>
      <About title="Explore further" socialMedia={socialMedia} />
    </ErrorPage>
  );
}

NotFoundError.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    settings: PropTypes.shape({
      socialMedia: PropTypes.shape({}).isRequired
    }).isRequired
  }).isRequired
};

export default withStyles(styles)(NotFoundError);
