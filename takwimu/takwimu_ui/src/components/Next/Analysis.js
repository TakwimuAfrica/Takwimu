import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Grid } from '@material-ui/core';

import Card from './Card';
import Section from '../Section';

const styles = theme => ({
  root: {
    width: '100% !important'
  },
  container: {
    flexGrow: 1,
    paddingBottom: '6.25rem'
  },
  cardMargin: {
    marginTop: '2rem',
    [theme.breakpoints.up('md')]: {
      marginTop: 0,
      marginLeft: '1.632352941rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      marginLeft: '2.176470588rem'
    }
  }
});

function AnalysisReadNext({ classes }) {
  return (
    <Section classes={{ root: classes.root }} title="Read next..." variant="h3">
      <Grid
        container
        justify="center"
        alignItems="center"
        className={classes.container}
      >
        <Card href="#/" variant="dual">
          South African <br /> Politician Profiles
        </Card>

        <Card href="#/" classes={{ root: classes.cardMargin }} variant="dual">
          South African <br /> Government Bodies
        </Card>
      </Grid>
    </Section>
  );
}

AnalysisReadNext.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(AnalysisReadNext);
