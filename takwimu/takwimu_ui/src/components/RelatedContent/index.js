import React from 'react';
import PropTypes from 'prop-types';

import { withStyles, Grid } from '@material-ui/core';

import Links from './Links';
import Section from '../Section';

const styles = () => ({
  root: {
    flexGrow: 1
  }
});

function RelatedContent({
  classes,
  takwimu: {
    page: { relatedContent }
  }
}) {
  const firstBatch = relatedContent.slice(0, 4);
  const secondBatch = relatedContent.slice(4, 8);

  return (
    <Section title="Related Content" variant="h3">
      <Grid
        container
        className={classes.root}
        justify="center"
        alignItems="flex-start"
      >
        {firstBatch && firstBatch.length && <Links items={firstBatch} />}
        {secondBatch && secondBatch.length && <Links items={secondBatch} />}
      </Grid>
    </Section>
  );
}

RelatedContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    page: PropTypes.shape({
      relatedContent: PropTypes.arrayOf(PropTypes.shape({}).isRequired)
        .isRequired
    }).isRequired
  }).isRequired
};

export default withStyles(styles)(RelatedContent);
