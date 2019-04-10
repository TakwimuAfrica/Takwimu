import React from 'react';
import { PropTypes } from 'prop-types';

import { Grid, withStyles } from '@material-ui/core';

import Section from '../Section';
import WhereToNextCard from './WhereToNextCard';

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
  }
});

function HomeWhereToNext({ classes }) {
  return (
    <Section title="Where to next" variant="h3">
      <Grid
        container
        spacing={40}
        justify="center"
        alignItems="center"
        className={classes.root}
      >
        <WhereToNextCard title="Stay up-to-date with new data and analysis" />
        <WhereToNextCard title="Looking for other services?" />
        <WhereToNextCard title="Talk to us" />
      </Grid>
    </Section>
  );
}

HomeWhereToNext.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(HomeWhereToNext);
