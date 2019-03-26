import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Typography, Grid } from '@material-ui/core';
import { ArrowDropUp } from '@material-ui/icons';

import DataActions from './DataActions';

const styles = theme => ({
  root: {
    padding: '20px',
    backgroundColor: theme.palette.data.main
  },
  title: {
    fontFamily: '"Roboto"',
    fontSize: '1.25rem',
    textAlign: 'center',
    fontWeight: 'bold',
    fontStyle: 'normal',
    fontStretch: 'normal',
    lineHeight: 1.2,
    letterSpacing: 'normal'
  },
  description: {
    marginLeft: '0.625rem'
  }
});

function DataContainer({ classes, color, data }) {
  return (
    <div>
      <div className={classes.root}>
        <Grid container direction="column" alignItems="center">
          <Typography className={classes.title} color={color}>
            {data.title}
          </Typography>
          <DataActions />
        </Grid>
      </div>
      <Grid container direction="row" wrap="nowrap">
        <Grid item>
          <ArrowDropUp color="primary" />
        </Grid>
        <Grid item>
          <Typography className={classes.description}>
            {data.description}
          </Typography>
        </Grid>
      </Grid>
    </div>
  );
}

DataContainer.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  data: PropTypes.shape({}).isRequired,
  color: PropTypes.string.isRequired
};

export default withStyles(styles)(DataContainer);
