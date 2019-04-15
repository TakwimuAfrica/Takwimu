import React from 'react';
import PropTypes from 'prop-types';

import classNames from 'classnames';

import { Grid } from '@material-ui/core';
import { withStyles } from '@material-ui/core/styles';

import Story from './Story';

const styles = () => ({
  root: {
    flexGrow: 1
  },
  margin: {
    marginTop: '3.375rem'
  }
});

function StoryList({ classes, stories }) {
  return (
    <Grid
      container
      className={classes.root}
      justify="flex-start"
      alignItems="stretch"
    >
      {stories.slice(0, 3).map((story, index) => (
        <Story
          key={story.link}
          story={story}
          classes={{ root: classNames({ [classes.margin]: index > 0 }) }}
        />
      ))}
    </Grid>
  );
}

StoryList.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  stories: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired
};

export default withStyles(styles)(StoryList);
