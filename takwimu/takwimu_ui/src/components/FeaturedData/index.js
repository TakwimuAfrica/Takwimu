import React from 'react';
import { PropTypes } from 'prop-types';

import { Grid, withStyles } from '@material-ui/core';

import Section from '../Section';
import DataContainer from './DataContainer';

import featuredData from './data';

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

function FeaturedData({ classes }) {
  return (
    <Section title="Featured Data" variant="h2">
      <Grid
        container
        spacing={40}
        direction="row"
        justify="space-between"
        className={classes.root}
      >
        <Grid md={6} item container>
          <DataContainer data={featuredData[0]} />
        </Grid>
        <Grid md={6} item container>
          <DataContainer data={featuredData[1]} />
        </Grid>
      </Grid>
    </Section>
  );
}

FeaturedData.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(FeaturedData);
