import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Grid, Link } from '@material-ui/core';
import { Search } from '@material-ui/icons';

import logoWhite from '../../assets/images/logo-white-all.png';
import DropDowns from './DropDowns';

const styles = theme => ({
  root: {
    backgroundColor: theme.palette.primary.main,
    height: '6.313rem'
  }
});

function Navigation({ classes }) {
  return (
    <Grid
      container
      justify="space-around"
      alignItems="center"
      className={classes.root}
    >
      <Grid item>
        <Link href="/">
          <img alt="logo" src={logoWhite} height={22} />
        </Link>
      </Grid>
      <Grid item>
        <DropDowns />
      </Grid>
      <Grid item>
        <Grid container justify="space-evenly" style={{ width: '400px' }}>
          <Link href="/">About Us</Link>
          <Link href="/">FAQs</Link>
          <Link href="/">Contact Us</Link>
          <Link href="/">
            <Search />
          </Link>
        </Grid>
      </Grid>
    </Grid>
  );
}

Navigation.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(Navigation);
