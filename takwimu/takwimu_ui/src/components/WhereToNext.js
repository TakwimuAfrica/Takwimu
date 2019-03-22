import React from 'react';

import { Typography, Grid, withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';
import Section from './comon/Section';

const styles = theme => ({
  box: {
    backgroundColor: theme.palette.primary.main,
    width: '24.5rem',
    height: '14.875rem',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    padding: '1.25rem'
  },
  label: {
    fontSize: '1.75rem',
    fontWeight: 'bold',
    textAlign: 'center',
    color: 'white',
    margin: '0 auto'
  }
});

function WhereToNext({ classes }) {
  return (
    <Section>
      <Typography variant="h2">Where to next</Typography>
      <Grid container justify="space-between" alignItems="center">
        <Grid item>
          <div className={classes.box}>
            <Typography variant="body1" className={classes.label}>
              Stay up-to-date with new data and analysis
            </Typography>
          </div>
        </Grid>
        <Grid item>
          <div className={classes.box}>
            <Typography variant="body1" className={classes.label}>
              Looking for other services?
            </Typography>
          </div>
        </Grid>
        <Grid item>
          <div className={classes.box}>
            <Typography variant="body1" className={classes.label}>
              Talk to us
            </Typography>
          </div>
        </Grid>
      </Grid>
    </Section>
  );
}

WhereToNext.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(WhereToNext);
