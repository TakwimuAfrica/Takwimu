import React from 'react';
import PropTypes from 'prop-types';

import { Grid, Typography } from '@material-ui/core';

import { withStyles } from '@material-ui/core/styles';

import Section from '../Section';
import Story from './Story';
import stories from './stories';

const styles = () => ({
  sectionTitle: {
    margin: '0 0 1.1875rem 0'
  },
  story: {}
});

function LatestNewsStories({ classes }) {
  return (
    <Section
      title="Latest News &amp; Stories"
      variant="h2"
      classes={{ title: classes.sectionTitle }}
    >
      <Typography variant="body1">
        Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum dolor
        sit amet, consectetur adipiscing elit.
      </Typography>
      <Grid container justify="flex-start" alignItems="stretch">
        {stories.map(story => (
          <div className={classes.story}>
            <Story key={story.link} story={story} />
          </div>
        ))}
      </Grid>
    </Section>
  );
}

LatestNewsStories.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(LatestNewsStories);
