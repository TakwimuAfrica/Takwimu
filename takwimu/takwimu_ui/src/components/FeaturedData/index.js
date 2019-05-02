import React from 'react';
import { PropTypes } from 'prop-types';

import { Grid, withStyles } from '@material-ui/core';

import Section from '../Section';
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

function FeaturedData({
  classes,
  takwimu: {
    page: {
      featured_data: { value: featuredData }
    }
  }
}) {
  if (!featuredData) {
    return null;
  }

  const { title, featured_data: featuredDataWidgets } = featuredData;
  return (
    <Section title={title} variant="h2">
      {featuredDataWidgets && featuredDataWidgets.length > 0 && (
        <Grid
          container
          direction="row"
          justify="space-between"
          alignItems="flex-start"
          className={classes.root}
        >
          <DataContainer
            color="secondary"
            featuredData={featuredDataWidgets[0].value}
          />
          {featuredDataWidgets.length > 1 && (
            <DataContainer
              color="primary"
              featuredData={featuredDataWidgets[1].value}
            />
          )}
        </Grid>
      )}
    </Section>
  );
}

FeaturedData.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    page: PropTypes.shape({
      featured_data: PropTypes.shape({
        value: PropTypes.shape({
          title: PropTypes.string.isRequired,
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
          )
        })
      }).isRequired
    }).isRequired
  }).isRequired
};

export default withStyles(styles)(FeaturedData);
