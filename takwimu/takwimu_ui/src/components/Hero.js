import React from 'react';
import { PropTypes } from 'prop-types';

import { Button, Grid, Typography, withStyles } from '@material-ui/core';

import Section from './Section';

import africanParliament from '../assets/images/africanparliament.jpg';
import triangle from '../assets/images/triangle.svg';

const styles = theme => ({
  section: {
    marginTop: '2.25rem'
  },
  root: {
    width: '100%',
    backgroundImage: `url(${africanParliament})`,
    backgroundRepeat: 'no-repeat',
    backgroundPosition: 'right bottom',
    backgroundSize: 'cover'
  },
  gradient: {
    backgroundImage: `linear-gradient(89deg, #ffffff, rgba(255, 255, 255, 0)),
      linear-gradient(to bottom, #ffffff, transparent)`
  },
  hero: {
    flexGrow: 1
  },
  title: {
    margin: 0,
    width: '100%',
    paddingTop: '0.5625rem',

    // Some words are too big to fit mobile so break them
    wordBreak: 'break-all',
    [theme.breakpoints.up('md')]: {
      maxWidth: '40rem',
      wordBreak: 'initial'
    }
  },
  description: {
    marginTop: '1.0625rem',
    marginBottom: '3.125rem',
    width: '100%',
    '& a': {
      color: theme.palette.primary.main
    },
    [theme.breakpoints.up('md')]: {
      maxWidth: '27.375rem'
    }
  },
  aboutLink: {
    color: theme.palette.primary.main
  },
  button: {
    marginBottom: '2.3125rem'
  },
  buttonIcon: {
    marginLeft: '1.9375rem'
  }
});

function Hero({
  classes,
  takwimu: {
    page: {
      hero: { value: hero }
    }
  }
}) {
  if (!hero) {
    return null;
  }

  const { title, tagline, watch_video_link_title: watchVideoLinkTitle } = hero;
  return (
    <div className={classes.root}>
      <div className={classes.gradient}>
        <Section classes={{ root: classes.section }}>
          <Grid
            container
            justify="flex-start"
            alignItems="flex-start"
            className={classes.hero}
          >
            <Grid item xs={12}>
              <Typography
                variant="h1"
                className={classes.title}
                dangerouslySetInnerHTML={{
                  __html: title
                }}
              />
            </Grid>
            <Grid item xs={12}>
              <Typography
                variant="body1"
                className={classes.description}
                dangerouslySetInnerHTML={{
                  __html: tagline
                }}
              />
            </Grid>
            <Grid item xs={12}>
              <Button href="#takwimuMakingOf" className={classes.button}>
                {watchVideoLinkTitle}{' '}
                <img alt="play" src={triangle} className={classes.buttonIcon} />
              </Button>
            </Grid>
          </Grid>
        </Section>
      </div>
    </div>
  );
}

Hero.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    page: PropTypes.shape({
      hero: PropTypes.shape({
        value: PropTypes.shape({
          title: PropTypes.string,
          tagline: PropTypes.string,
          watch_video_link_title: PropTypes.string
        })
      })
    }).isRequired
  }).isRequired
};

export default withStyles(styles)(Hero);
