import React from 'react';
import PropTypes from 'prop-types';

import { Typography } from '@material-ui/core';
import { withStyles } from '@material-ui/core/styles';

import gates from '../../assets/images/gates.png';

const styles = () => ({
  root: {
    width: '14.375rem'
  },
  text: {
    color: 'white',
    fontWeight: 800
  },
  img: {
    marginTop: '2.5625rem',
    width: '8.0625rem',
    height: 'auto'
  }
});

function StayInTouch({ classes }) {
  return (
    <div className={classes.root}>
      <Typography variant="body2" className={classes.text}>
        With support from
      </Typography>
      <img src={gates} alt="Bill & Melinda Gates" className={classes.img} />
    </div>
  );
}

StayInTouch.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(StayInTouch);
