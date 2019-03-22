import React from 'react';
import { PropTypes } from 'prop-types';

import { Grid, withStyles } from '@material-ui/core';

import AnalysisList from './AnalysisList';
import CurrentAnalysis from './CurrentAnalysis';
import Section from '../Section';

const styles = () => ({
  root: {
    flexGrow: 1
  },
  content: {
    paddingBottom: '1rem'
  },
  list: {
    height: '100%'
  }
});

function FeaturedAnalysis({ classes }) {
  return (
    <Section title="Featured Analysis" variant="h2">
      <Grid
        container
        justify="flex-start"
        alignItems="stretch"
        className={classes.root}
      >
        <CurrentAnalysis classes={{ content: classes.content }} />
        <AnalysisList classes={{ content: classes.list }} />
      </Grid>
    </Section>
  );
}

FeaturedAnalysis.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(FeaturedAnalysis);
