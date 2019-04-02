import React from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core/styles';

import A from '../A';
import Title from './Title';

import ap from '../../assets/images/ap.png';
import cfa from '../../assets/images/cfa.png';
import ihub from '../../assets/images/ihub.png';

const styles = theme => ({
  root: {
    width: '19.375rem'
  },
  img: {
    marginTop: '2.5625rem'
  },
  imgCfa: {
    marginLeft: '1rem',
    marginRight: '1rem',
    [theme.breakpoints.up('md')]: {
      marginLeft: '2.15625rem',
      marginRight: '2.25rem'
    },
    [theme.breakpoints.up('lg')]: {
      marginLeft: '2.875rem',
      marginRight: '3rem'
    }
  }
});

function Initiative({ classes }) {
  return (
    <div className={classes.root}>
      <Title>An initiative by</Title>
      <div className={classes.img}>
        <A href="//www.africapractice.com/">
          <img src={ap} alt="africapractice" />
        </A>
        <A href="//codeforafrica.org/">
          <img src={cfa} alt="Code for Africa" className={classes.imgCfa} />
        </A>
        <A href="//ihub.co.ke/">
          <img src={ihub} alt="iHub" />
        </A>
      </div>
    </div>
  );
}

Initiative.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(Initiative);
