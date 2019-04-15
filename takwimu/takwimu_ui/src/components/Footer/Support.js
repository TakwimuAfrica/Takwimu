import React from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core/styles';

import A from '../A';
import Title from './Title';

import gates from '../../assets/images/gates.png';

const styles = () => ({
  root: {
    width: '14.375rem'
  },
  img: {
    marginTop: '2.5625rem'
  }
});

function Support({ classes }) {
  return (
    <div className={classes.root}>
      <Title>With support from</Title>
      <A href="//www.gatesfoundation.org">
        <img src={gates} alt="Bill & Melinda Gates" className={classes.img} />
      </A>
    </div>
  );
}

Support.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(Support);
