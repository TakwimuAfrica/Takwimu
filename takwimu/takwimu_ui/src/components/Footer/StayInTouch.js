import React from 'react';
import PropTypes from 'prop-types';

import Grid from '@material-ui/core/Grid';

import { withStyles } from '@material-ui/core/styles';

import A from '../A';
import Title from './Title';

import email from '../../assets/images/email.svg';
import facebook from '../../assets/images/facebook.svg';
import group3 from '../../assets/images/group-3.svg';
import group3Copy from '../../assets/images/group-3-copy.svg';
import twitter from '../../assets/images/twitter.svg';

const styles = () => ({
  root: {
    width: '14.375rem'
  },
  icons: {
    marginTop: '2.25rem'
  },
  icon: {
    width: '1.5625rem',
    height: '1.5625rem',
    objectFit: 'contain',
    marginRight: '0.9375rem'
  }
});

function StayInTouch({ classes, settings: { support, socialMedia } }) {
  return (
    <div className={classes.root}>
      <Title>Stay in touch</Title>
      <Grid
        container
        justify="flex-start"
        alignItems="center"
        className={classes.icons}
      >
        <div className={classes.iconContainer}>
          <A
            href={`mailto:${support.hello}`}
            className={classes.links}
            target="_blank"
            rel="noopener noreferrer"
          >
            {' '}
            <img src={email} alt="" className={classes.icon} />
          </A>
        </div>
        <div className={classes.iconContainer}>
          <A href={socialMedia.twitter} className={classes.links}>
            <img src={twitter} alt="" className={classes.icon} />
          </A>
        </div>
        <div className={classes.iconContainer}>
          <A href={socialMedia.facebook} className={classes.links}>
            <img src={facebook} alt="" className={classes.icon} />
          </A>
        </div>
        <div className={classes.iconContainer}>
          <A href={socialMedia.medium} className={classes.links}>
            <img src={group3} alt="" className={classes.icon} />
          </A>
        </div>
        <div className={classes.iconContainer}>
          <A href={socialMedia.linkedin} className={classes.links}>
            <img src={group3Copy} alt="" className={classes.icon} />
          </A>
        </div>
      </Grid>
    </div>
  );
}

StayInTouch.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  settings: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(StayInTouch);
