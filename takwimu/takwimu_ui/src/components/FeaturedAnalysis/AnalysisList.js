import React from 'react';
import { PropTypes } from 'prop-types';

import { ButtonBase, Typography, Grid, withStyles } from '@material-ui/core';

const styles = theme => ({
  root: {
    flexGrow: 1,
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '14.53125rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '19.375rem'
    }
  },
  button: {
    width: '100%',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#ededec',
    padding: '2.015625rem 0.75rem',
    [theme.breakpoints.up('md')]: {
      justifyContent: 'flex-start',
      paddingTop: '2.015625rem', // .75 of lg
      paddingLeft: '1.78125rem', // .75 of lg
      paddingBottom: '2.015625rem', // .75 of lg
      paddingRight: '0.84375rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      paddingTop: '2.6875rem',
      paddingLeft: '2.375rem',
      paddingBottom: '2.6875rem',
      paddingRight: '1.125rem'
    }
  },
  currentButton: {
    paddingLeft: '0.375rem',
    backgroundColor: '#29a87c', // bluey-green
    borderLeft: '0.375rem solid #a0d9b3', // hospital-green
    [theme.breakpoints.up('md')]: {
      paddingTop: '2.015625rem', // .75 of lg
      paddingLeft: '1.78125rem', // .75 of lg
      paddingBottom: '2.015625rem', // .75 of lg
      paddingRight: '0.84375rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      paddingTop: '2.6875rem',
      paddingLeft: '2.375rem',
      paddingBottom: '2.6875rem',
      paddingRight: '1.125rem'
    }
  },
  label: {
    width: '100%',
    textAlign: 'left'
  },
  currentLabel: {
    color: 'white'
  }
});

function AnalysisList({ classes }) {
  return (
    <Grid
      container
      direction="row"
      justify="center"
      alignItems="stretch"
      className={classes.root}
    >
      <ButtonBase className={classes.button}>
        <Typography variant="subtitle2" className={classes.label}>
          Healthcare in Tanzania
        </Typography>
      </ButtonBase>
      <ButtonBase className={`${classes.button} ${classes.currentButton}`}>
        <Typography
          variant="subtitle2"
          className={`${classes.label} ${classes.currentLabel}`}
        >
          South Africa&rsquo;s Political System
        </Typography>
      </ButtonBase>
      <ButtonBase className={classes.button}>
        <Typography variant="subtitle2" className={classes.label}>
          Senegal&rsquo;s Budgetary Cycle
        </Typography>
      </ButtonBase>
    </Grid>
  );
}

AnalysisList.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(AnalysisList);
