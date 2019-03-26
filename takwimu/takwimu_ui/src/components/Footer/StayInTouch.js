import React from 'react';
import PropTypes from 'prop-types';

import Grid from '@material-ui/core/Grid';

import { Typography } from '@material-ui/core';
import { withStyles } from '@material-ui/core/styles';

import A from '../A';

import email from '../../assets/images/email.svg';
import facebook from '../../assets/images/facebook.svg';
import group3 from '../../assets/images/group-3.svg';
import group3Copy from '../../assets/images/group-3-copy.svg';
import twitter from '../../assets/images/twitter.svg';

const styles = () => ({
  root: {
    flexGrow: 1
  },
  title: {
    color: 'white',
    fontWeight: 800
  },
  icon: {
    width: '1.5625rem',
    height: '1.5625rem',
    objectFit: 'contain',
    marginRight: '0.9375rem'
  }
});

function StayInTouch({ classes }) {
  return (
    <Grid
      container
      justify="flex-start"
      alignitems="center"
      className={classes.root}
    >
      <Grid item xs={12}>
        <Typography variant="body2" className={classes.title}>
          Stay in touch
        </Typography>
      </Grid>
      <Grid item xs={12}>
        <Grid container justify="flex-start" alignItems="center">
          <div className={classes.iconContainer}>
            <A
              href="mailto://hello@takwimu.africa"
              className={classes.links}
              target="_blank"
              rel="noopener noreferrer"
            >
              <img src={email} alt="" className={classes.icon} />
            </A>
          </div>
          <div className={classes.iconContainer}>
            <A
              href="https://twitter.com/TakwimuAfrica"
              className={classes.links}
            >
              <img src={twitter} alt="" className={classes.icon} />
            </A>
          </div>
          <div className={classes.iconContainer}>
            <A
              href="https://facebook.com/TakwimuAfrica"
              className={classes.icon}
            >
              <img src={facebook} alt="" className={classes.icon} />
            </A>
          </div>
          <div className={classes.iconContainer}>
            <A
              href="https://medium.com/takwimu-africa"
              className={classes.links}
            >
              <img src={group3} alt="" className={classes.icon} />
            </A>
          </div>
          <div className={classes.iconContainer}>
            <A
              href="https://www.linkedin.com/company/takwimu-africa/"
              className={classes.links}
            >
              <img src={group3Copy} alt="" className={classes.icon} />
            </A>
          </div>
        </Grid>
      </Grid>
    </Grid>
  );
}

StayInTouch.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(StayInTouch);
