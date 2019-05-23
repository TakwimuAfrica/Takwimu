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
    marginBottom: '2.1875rem',
    padding: '1rem 0'
  },
  buttonRoot: {
    marginBottom: '3.0625rem'
  }
});

function LatestNewsStories({
  classes,
  takwimu: {
    page: {
      latest_news_stories: {
        title,
        description,
        read_more_link_label: readMore,
        stories
      }
    },
    settings: {
      socialMedia: { medium }
    }
  },
  width
}) {
  if (!title) {
    return null;
  }

  // Wagtail inserts div/p when RichTextField is empty
  const hasDescription = () =>
    description &&
    description.length > 0 &&
    description !== '<p></p>' &&
    description !== '<div class="rich-text"></div>';
  const Stories = isWidthUp('md', width) ? StoryBlocks : StoryList;
  return (
    <Section
      title={title}
      variant="h2"
      classes={{ title: classes.sectionTitle }}
    >
      <Grid
        container
        justify="flex-start"
        alignItems="flex-start"
        className={classes.root}
      >
        {hasDescription() && (
          <Grid item xs={12}>
            <Typography
              variant="body1"
              classes={{ root: classes.descriptionRoot }}
              dangerouslySetInnerHTML={{
                __html: description
              }}
            />
          </Grid>
        )}
        <Grid item xs={12}>
          <A href={medium} underline="none" component="button">
            <Button classes={{ root: classes.buttonRoot }}>{readMore}</Button>
          </A>
        </Grid>
        {stories && stories.length > 0 && (
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
    page: PropTypes.shape({
      latest_news_stories: PropTypes.shape({
        title: PropTypes.string,
        description: PropTypes.string,
        read_more_link_label: PropTypes.string,
        stories: PropTypes.arrayOf(PropTypes.shape({}))
      })
    }).isRequired,
    settings: PropTypes.shape({
      socialMedia: PropTypes.shape({
        medium: PropTypes.string.isRequired
      }).isRequired
    }).isRequired
  }).isRequired,
  width: PropTypes.string.isRequired
};

export default withWidth()(withStyles(styles)(LatestNewsStories));
