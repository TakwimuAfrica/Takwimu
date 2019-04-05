import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, ButtonBase, Grid, Typography } from '@material-ui/core';

import Section from './Section';

const styles = theme => ({
  root: {
    flexGrow: 1,
    paddingBottom: '6.25rem'
  },
  box: {
    backgroundColor: theme.palette.primary.main,
    width: '100%',
    height: '14.875rem',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    [theme.breakpoints.up('md')]: {
      width: '18.375rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '24.5rem'
    }
  },
  middlebox: {
    margin: '2rem 0',
    [theme.breakpoints.up('md')]: {
      margin: '0 1.5rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      margin: '0 2rem'
    }
  },
  label: {
    textAlign: 'center',
    color: 'white',
    margin: '0 auto',
    fontWeight: 'bold'
  }
});

function WhereToNext({ classes }) {
  return (
    <Section title="Where to next" variant="h3">
      <Grid
        container
        justify="center"
        alignItems="center"
        className={classes.root}
      >
        <div className={classes.box}>
          <Typography variant="subtitle1" className={classes.label}>
            Stay up-to-date with <br /> new data and analysis
          </Typography>
        </div>
        <ButtonBase
          href="/about"
          className={`${classes.box} ${classes.middlebox}`}
        >
          <Typography variant="subtitle1" className={classes.label}>
            Looking for other <br /> services?
          </Typography>
        </ButtonBase>

        <ButtonBase href="/contact-us" className={classes.box}>
          <Typography variant="subtitle1" className={classes.label}>
            Talk to us
          </Typography>
        </ButtonBase>
      </Grid>
    </Section>
  );
}

WhereToNext.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(WhereToNext);
