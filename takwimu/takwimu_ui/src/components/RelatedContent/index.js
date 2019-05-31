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

function RelatedContent({ classes, content: { value: relatedContent } }) {
  if (!relatedContent) {
    return null;
  }

  const { title, related_links: relatedLinks } = relatedContent;
  const firstBatch = relatedLinks.slice(0, 4);
  const secondBatch = relatedLinks.slice(4, 8);

  return (
    firstBatch.length > 0 && (
      <Section
        title={title}
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
  content: PropTypes.shape({
    value: PropTypes.shape({
      title: PropTypes.string,
      related_links: PropTypes.arrayOf(
        PropTypes.shape({
          type: PropTypes.string,
          value: PropTypes.shape({
            title: PropTypes.string,
            link: PropTypes.string
          })
        })
      )
    })
  }).isRequired
};

export default withStyles(styles)(RelatedContent);
