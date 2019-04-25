import React from 'react';
import PropTypes from 'prop-types';

import { Button, Grid, Typography } from '@material-ui/core';
import { withStyles } from '@material-ui/core/styles';
import withWidth, { isWidthUp } from '@material-ui/core/withWidth';

import A from '../A';
import Section from '../Section';
import StoryBlocks from './StoryBlocks';
import StoryList from './StoryList';

const styles = () => ({
  sectionTitle: {
    margin: '0 0 1.1875rem 0'
  },
  root: {},
  descriptionRoot: {
    marginBottom: '2.1875rem'
  },
  buttonRoot: {
    marginBottom: '3.0625rem'
  }
});

function LatestNewsStories({
  classes,
  takwimu: {
    latest_news_stories: { description, stories }
  },
  width
}) {
  const Stories = isWidthUp('md', width) ? StoryBlocks : StoryList;
  return (
    <Section
      title="Latest News &amp; Stories"
      variant="h2"
      classes={{ title: classes.sectionTitle }}
    >
      <Grid
        container
        justify="flex-start"
        alignItems="flex-start"
        className={classes.root}
      >
        {description && (
          <Grid item xs={12}>
            <Typography
              variant="body1"
              classes={{ root: classes.descriptionRoot }}
            >
              {description}
            </Typography>
          </Grid>
        )}
        <Grid item xs={12}>
          <A href="https://medium.com/takwimu-africa" underline="none">
            <Button classes={{ root: classes.buttonRoot }}>
              Read more stories on Medium
            </Button>
          </A>
        </Grid>
        {stories.length > 0 && (
          <Grid item xs={12}>
            <Stories stories={stories} />
          </Grid>
        )}
      </Grid>
    </Section>
  );
}

LatestNewsStories.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    latest_news_stories: PropTypes.shape({
      description: PropTypes.string.isRequired,
      stories: PropTypes.arrayOf(PropTypes.shape({}).isRequired)
    }).isRequired
  }).isRequired,
  width: PropTypes.string.isRequired
};

export default withWidth()(withStyles(styles)(LatestNewsStories));
