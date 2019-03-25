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
      paddingLeft: '2.4375rem', // .75 of lg
      paddingRight: '2.71875rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      paddingLeft: '3.25rem',
      paddingRight: '3.625rem'
    }
  },
  header: {
    paddingTop: '3.0625rem',
    paddingBottom: '1.875rem'
  },
  flag: {
    marginRight: '1.5rem'
  },
  title: {
    margin: 0
  },
  body: {
    paddingBottom: '1.875rem'
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

function CurrentAnalysis({ classes, content }) {
  return (
    <div className={classes.root}>
      <Grid
        container
        justify="flex-start"
        alignItems="center"
        className={classes.content}
      >
        <Grid item xs={12}>
          <Grid
            container
            justify="flex-start"
            alignItems="center"
            className={classes.header}
          >
            <img src={flag} alt="South Africa" className={classes.flag} />
            <Typography variant="h4" component="h1" className={classes.title}>
              {content.title}
            </Typography>
          </Grid>
        </Grid>
        <Grid item xs={12}>
          <Typography variant="body1" className={classes.body}>
            {content.summary}
          </Typography>
        </Grid>
        <Grid item xs={12}>
          <Grid
            container
            justify="flex-start"
            alignItems="center"
            className={classes.actions}
          >
            <Button href={content.links.analysis}>
              Read the full analysis
            </Button>
            <Button
              href={content.links.data}
              className={classes.secondaryAction}
              variant="outlined"
            >
              View country profile
            </Button>
          </Grid>
        </Grid>
      </Grid>
    </div>
  );
}

CurrentAnalysis.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  content: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(CurrentAnalysis);
