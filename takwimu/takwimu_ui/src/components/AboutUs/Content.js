import React from 'react';
import { Grid, Typography, withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';

const styles = {
  root: {
    maxWidth: '933px'
  },
  title: {
    margin: '37px 0 22px 19px'
  },
  body: {
    padding: '0 19px'
  }
};

function Content({ classes }) {
  return (
    <div className={classes.root}>
      <Typography className={classes.title} variant="h2">
        About Us
      </Typography>
      <Grid>
        <Typography className={classes.label}>On this page</Typography>
      </Grid>
    </div>
  );
}

Content.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(Content);
