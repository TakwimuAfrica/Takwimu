import React from 'react';
import PropTypes from 'prop-types';

import { withStyles, Grid } from '@material-ui/core';

import Links from './Links';
import Section from '../Section';

const styles = () => ({
  sectionRoot: {
    margin: '0 0 2.3125rem 0'
  },
  root: {
    flexGrow: 1
  }
});

function RelatedContent({ classes, relatedContent }) {
  const firstBatch = relatedContent.slice(0, 4);
  const secondBatch = relatedContent.slice(4, 8);

  return (
    firstBatch.length > 0 && (
      <Section
        title="Related Content"
        variant="h3"
        classes={{ root: classes.sectionRoot }}
      >
        <Grid
          container
          className={classes.root}
          justify="flex-start"
          alignItems="flex-start"
        >
          <Links items={firstBatch} />
          {secondBatch.length > 0 && <Links items={secondBatch} />}
        </Grid>
      </Section>
    )
  );
}

RelatedContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  relatedContent: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired
};

export default withStyles(styles)(RelatedContent);
