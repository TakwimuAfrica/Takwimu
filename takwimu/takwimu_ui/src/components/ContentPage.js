import React from 'react';
import { PropTypes } from 'prop-types';

import { Grid, withStyles } from '@material-ui/core';

import Section from './Section';

const styles = theme => ({
  root: {},
  aside: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '10.5rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '14rem'
    }
  },
  main: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '44.671875rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '59.5625rem'
    }
  }
});

function ContentPage({ aside, children, classes }) {
  return (
    <Section classes={{ root: classes.root }}>
      <Grid container justify="space-between">
        <div className={classes.aside}>{aside}</div>
        <div className={classes.main}>{children}</div>
      </Grid>
    </Section>
  );
}

ContentPage.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  aside: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]).isRequired,
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]).isRequired
};

export default withStyles(styles)(ContentPage);
