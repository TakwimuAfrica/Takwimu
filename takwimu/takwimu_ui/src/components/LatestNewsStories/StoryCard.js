import React from 'react';
import PropTypes from 'prop-types';

import { Card, CardContent, CardMedia, Typography } from '@material-ui/core';

import { withStyles } from '@material-ui/core/styles';

import A from '../A';

const styles = theme => ({
  root: {},
  media: {
    height: '17.625rem'
  },
  titleGutterBottom: {
    marginBottom: '1.375rem'
  },
  link: {
    color: theme.palette.primary.main,
    fontWeight: 'bold'
  }
});

function StoryCard({ classes, story }) {
  return (
    <Card classes={{ root: classes.root }}>
      <CardMedia
        className={classes.media}
        component="a"
        href={story.url}
        target="_blank"
        image={story.preview_image.url}
        title={story.title}
      />
      <CardContent>
        <Typography
          gutterBottom
          variant="body1"
          component="h2"
          classes={{ gutterBottom: classes.titleGutterBottom }}
        >
          <A href={story.url} className={classes.link}>
            {story.title}
          </A>
        </Typography>
      </CardContent>
    </Card>
  );
}

StoryCard.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  story: PropTypes.shape({
    preview_image: PropTypes.shape({}).isRequired,
    title: PropTypes.string.isRequired,
    url: PropTypes.string.isRequired
  }).isRequired
};

export default withStyles(styles)(StoryCard);
