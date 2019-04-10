import React from 'react';
import { PropTypes } from 'prop-types';

import { Typography, Grid, withStyles } from '@material-ui/core';

const styles = theme => ({
  box: {
    backgroundColor: theme.palette.primary.main,
    width: '100%',
    height: '14.875rem',
    [theme.breakpoints.up('md')]: {
      width: '18.375rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '24.5rem'
    }
  },
  label: {
    textAlign: 'center',
    color: 'white',
    margin: '2.5em',
    fontWeight: 'bold'
  }
});

function WhereToNextCard({ classes, title }) {
  return (
    <Grid
      container
      direction="column"
      alightItems="center"
      justify="center"
      className={classes.box}
    >
      <Typography variant="body1" className={classes.label}>
        {title}
      </Typography>
    </Grid>
  );
}

WhereToNextCard.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  title: PropTypes.string
};

WhereToNextCard.defaultProps = {
  title: ''
};
export default withStyles(styles)(WhereToNextCard);
