import React from 'react';
import { PropTypes } from 'prop-types';

import { Typography, Grid, withStyles } from '@material-ui/core';

const styles = theme => ({
  card: {
    backgroundColor: theme.palette.primary.main,
    width: '100%',
    height: '12.875rem',
    margin: '0.8rem',
    borderRadius: '0',
    [theme.breakpoints.up('md')]: {
      width: '18.375rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '24.5rem'
    }
  },

  label: {
    textAlign: 'center',
    fontSize: '22px',
    color: 'white',
    margin: '2rem 1rem',
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
      className={classes.card}
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
