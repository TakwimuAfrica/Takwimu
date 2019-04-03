import React from 'react';
import PropTypes from 'prop-types';

import { Grid } from '@material-ui/core';

import { withStyles } from '@material-ui/core/styles';

import StoryCard from './StoryCard';
import StorySummary from './StorySummary';

const styles = () => ({
  root: {
    flexGrow: 1,
    width: '23.625rem',
    height: '100%'
  }
});

function Story({ classes, story }) {
  return (
    <Grid
      container
      direction="row"
      className={classes.root}
      justify="space-between"
      alignItems="center"
    >
      <StoryCard story={story} />
      <StorySummary story={story} />
    </Grid>
  );
}

Story.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  story: PropTypes.shape({
    img: PropTypes.string.isRequired,
    title: PropTypes.string.isRequired,
    link: PropTypes.string.isRequired,
    summary: PropTypes.string.isRequired
  }).isRequired
};

export default withStyles(styles)(Story);
