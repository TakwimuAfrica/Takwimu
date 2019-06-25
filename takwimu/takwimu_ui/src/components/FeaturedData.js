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

  const { title, featured_data: indicators } = featuredData;
  return (
    <Section title={title} variant="h2">
      {indicators && indicators.length > 0 && (
        <Grid
          container
          direction="row"
          justify="space-between"
          alignItems="flex-start"
          className={classes.root}
        >
          <DataContainer
            id={indicators[0].id}
            color="secondary"
            indicator={indicators[0]}
            // Since we don't know the county of the featured data
            country={{
              name: 'Featured Data'
            }}
          />
          {indicators.length > 1 && (
            <DataContainer
              id={indicators[1].id}
              color="primary"
              indicator={indicators[1]}
              // Since we don't know the county of the featured data
              country={{
                name: 'Featured Data'
              }}
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
              value: PropTypes.shape({}).isRequired,
              meta: PropTypes.shape({}).isRequired
            }).isRequired
          )
        })
      }).isRequired
    }).isRequired
  }).isRequired
};

export default withStyles(styles)(FeaturedData);
