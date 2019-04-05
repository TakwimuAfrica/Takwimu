import React from 'react';
import PropTypes from 'prop-types';

import { Button, Grid, Typography } from '@material-ui/core';

import { withStyles } from '@material-ui/core/styles';

import A from '../A';
import Section from '../Section';
import StoryList from './StoryList';

import stories from './stories';

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

function LatestNewsStories({ classes }) {
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
        <Grid item xs={12}>
          <Typography
            variant="body1"
            classes={{ root: classes.descriptionRoot }}
          >
            Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum
            dolor sit amet, consectetur adipiscing elit.
          </Typography>
        </Grid>
        <Grid item xs={12}>
          <A href="https://medium.com/takwimu-africa">
            <Button classes={{ root: classes.buttonRoot }}>
              Read more stories on Medium
            </Button>
          </A>
        </Grid>
        <Grid item xs={12}>
          <StoryList stories={stories} />
        </Grid>
      </Grid>
    </Section>
  );
}

LatestNewsStories.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(LatestNewsStories);
