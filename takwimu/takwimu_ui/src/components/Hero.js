import React from 'react';
import { PropTypes } from 'prop-types';

import { Button, Link, Grid, Typography, withStyles } from '@material-ui/core';

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

function Hero({ classes, takwimu: { tagline } }) {
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
              <Typography variant="h1" className={classes.title}>
                Actionable insights for African changemakers
              </Typography>
            </Grid>
            {tagline && tagline.description && (
              <Grid item xs={12}>
                <Typography variant="body1" className={classes.description}>
                  {tagline.description}{' '}
                  <Link
                    href="/about"
                    className={classes.aboutLink}
                    underline="always"
                  >
                    find out more about us
                  </Link>
                </Typography>
              </Grid>
            )}
            <Grid item xs={12}>
              <Button href="#takwimuMakingOf" className={classes.button}>
                Watch the overview video{' '}
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
    tagline: PropTypes.shape({}).isRequired
  }).isRequired
};

export default withStyles(styles)(Hero);
