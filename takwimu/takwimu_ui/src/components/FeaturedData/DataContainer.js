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
    fontFamily: 'Roboto',
    fontSize: '1.25rem'
  },
  description: {
    marginLeft: '0.625rem'
  }
});

function DataContainer({ classes, data }) {
  return (
    <div>
      <div className={classes.root}>
        <Typography className={classes.title}>{data.title}</Typography>
        <DataActions />
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
  data: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(DataContainer);
