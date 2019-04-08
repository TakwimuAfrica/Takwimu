import React from 'react';
import PropTypes from 'prop-types';

import classNames from 'classnames';

import { Grid } from '@material-ui/core';

import { withStyles } from '@material-ui/core/styles';

import StoryCard from './StoryCard';
import StorySummary from './StorySummary';

const styles = theme => ({
  root: {},
  story: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '17.72625rem'
    },
    [theme.breakpoints.up('lg')]: {
      width: '23.625rem'
    }
  }
});

function Story({ classes, story }) {
  return (
    <Grid
      container
      direction="column"
      className={classNames([classes.root, classes.story])}
      justify="space-between"
      alignItems="center"
    >
      <StoryCard story={story} classes={{ root: classes.story }} />
      <StorySummary story={story} classes={{ root: classes.story }} />
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
