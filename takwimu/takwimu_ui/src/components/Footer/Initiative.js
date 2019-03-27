import React from 'react';
import PropTypes from 'prop-types';

import { Typography } from '@material-ui/core';
import { withStyles } from '@material-ui/core/styles';

import ap from '../../assets/images/ap.png';
import cfa from '../../assets/images/cfa.png';
import ihub from '../../assets/images/ihub.png';

const styles = () => ({
  root: {
    width: '19.375rem'
  },
  text: {
    color: 'white',
    fontWeight: 800
  },
  img: {
    marginTop: '2.5625rem'
  },
  imgAp: {
    width: '7.375rem',
    height: 'auto'
  },
  imgCfa: {
    width: '3.9375rem',
    height: 'auto',
    marginLeft: '2.875rem',
    marginRight: '3rem'
  },
  imgIhub: {
    width: '2.1875rem',
    height: 'auto'
  }
});

function StayInTouch({ classes }) {
  return (
    <div className={classes.root}>
      <Typography variant="body2" className={classes.text}>
        An initiative by
      </Typography>
      <div className={classes.img}>
        <img src={ap} alt="Takwimu" className={classes.imgAp} />
        <img src={cfa} alt="Code for Africa" className={classes.imgCfa} />
        <img src={ihub} alt="iHub" className={classes.imgIhub} />
      </div>
    </div>
  );
}

StayInTouch.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(StayInTouch);
