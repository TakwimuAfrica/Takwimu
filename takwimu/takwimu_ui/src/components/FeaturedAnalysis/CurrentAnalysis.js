import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Button, Grid, Typography } from '@material-ui/core';

import flag from '../../assets/images/flag.png';

const styles = theme => ({
  root: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '43.734375rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '58.3125rem'
    }
  },
  content: {
    flexGrow: 1,
    backgroundColor: '#f6fbfa', // ice-blue
    width: '100%',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    [theme.breakpoints.up('md')]: {
      paddingLeft: '2.484375rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      paddingLeft: '3.3125rem'
    }
  },
  flag: {
    marginRight: '1.5rem'
  },
  body: {
    [theme.breakpoints.up('md')]: {
      padding: '1.875rem 3.625rem 1.875rem 0'
    }
  },
  actions: {
    marginBottom: '3.0625rem'
  },
  secondaryAction: {
    marginTop: '1rem',
    [theme.breakpoints.up('md')]: {
      marginTop: 0,
      marginLeft: '2.15625rem' // .75 lg
    },
    [theme.breakpoints.up('lg')]: {
      marginLeft: '2.875rem'
    }
  }
});

function CurrentAnalysis({ classes }) {
  return (
    <div className={classes.root}>
      <Grid
        container
        justify="flex-start"
        alignItems="center"
        className={classes.content}
      >
        <Grid item xs={12}>
          <Grid container justify="flex-start" alignItems="center">
            <img src={flag} alt="South Africa" className={classes.flag} />
            <Typography variant="h4" component="h1">
              South Africa&rsquo;s Political System
            </Typography>
          </Grid>
        </Grid>
        <Grid item xs={12}>
          <Typography variant="body1" className={classes.body}>
            South Africa’s current political system was established with the
            proclamation of a new constitution after the overthrow of apartheid
            in the early 1990s, which marked the introduction of universal
            suffrage. Since then, the country has been governed by the African
            National Congress, which has dominated the national political
            landscape. Cyril Ramaphosa became President in early 2018 following
            the resignation of Jacob Zuma.
          </Typography>
        </Grid>
        <Grid item xs={12}>
          <Grid
            container
            justify="flex-start"
            alignItems="center"
            className={classes.actions}
          >
            <Button>Read the full analysis</Button>
            <Button className={classes.secondaryAction} variant="outlined">
              View country profile
            </Button>
          </Grid>
        </Grid>
      </Grid>
    </div>
  );
}

CurrentAnalysis.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(CurrentAnalysis);
