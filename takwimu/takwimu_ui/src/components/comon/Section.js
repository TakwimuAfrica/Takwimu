import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, Grid } from '@material-ui/core';

const styles = {
  root: {
    padding: '1.25rem 6.25rem'
  }
};

function Section({ classes, children }) {
  return (
    <Grid container className={classes.root}>
      {children}
    </Grid>
  );
}

Section.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]).isRequired
};

export default withStyles(styles)(Section);
