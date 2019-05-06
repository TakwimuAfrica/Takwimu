import React from 'react';
import { PropTypes } from 'prop-types';

import { Grid, withStyles } from '@material-ui/core';

import Section from './Section';
import DataContainer from './DataContainer';

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

function FeaturedData({ classes, takwimu: { featured_data: featuredData } }) {
  return (
    <Section title="Featured Data" variant="h2">
      {featuredData && featuredData.length ? (
        <Grid
          container
          direction="row"
          justify="space-between"
          alignItems="flex-start"
          className={classes.root}
        >
          <DataContainer color="secondary" data={featuredData[0]} />
          <DataContainer color="primary" data={featuredData[1]} />
        </Grid>
      ) : null}
    </Section>
  );
}

FeaturedData.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    featured_data: PropTypes.arrayOf(
      PropTypes.shape({
        value: PropTypes.shape({
          title: PropTypes.string.isRequired,
          country: PropTypes.string.isRequired,
          data_id: PropTypes.string.isRequired,
          chart_type: PropTypes.string.isRequired,
          data_stat_type: PropTypes.string.isRequired,
          description: PropTypes.string.isRequired
        }).isRequired
      }).isRequired
    ).isRequired
  }).isRequired
};

export default withStyles(styles)(FeaturedData);
