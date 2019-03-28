import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Typography, Grid } from '@material-ui/core';
import { ArrowDropUp } from '@material-ui/icons';

import DataActions from './DataActions';

const styles = theme => ({
  root: {
    margin: '20px 0',
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '45%',
      margin: '20px'
    }
  },
  descriptionContainer: {
    padding: '0 0.625em',
    [theme.breakpoints.up('md')]: {
      padding: '0 2.625rem'
    }
  },
  dataContainer: {
    padding: '0.625rem',
    backgroundColor: theme.palette.data.main,
    [theme.breakpoints.up('md')]: {
      padding: '1.25rem'
    }
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
    marginLeft: '1.25rem'
  }
});

function DataContainer({ classes, color, data }) {
  return (
    <div className={classes.root}>
      <div className={classes.dataContainer}>
        <Grid container direction="column" alignItems="center">
          <Typography className={classes.title} color={color}>
            {data.title}
          </Typography>
          <DataActions />
        </Grid>
      </div>
      <div className={classes.descriptionContainer}>
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
    </div>
  );
}

DataContainer.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  data: PropTypes.shape({}).isRequired,
  color: PropTypes.string.isRequired
};

export default withStyles(styles)(DataContainer);
