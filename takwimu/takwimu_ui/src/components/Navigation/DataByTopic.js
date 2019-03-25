import React from 'react';
import PropTypes from 'prop-types';

import { withStyles, Grid, Typography, Button } from '@material-ui/core';

const styles = theme => ({
  root: {
    backgroundColor: theme.palette.primary.main,
    width: '100%',
    height: '12.5rem',
    padding: '0 6.25rem'
  },
  countryButton: {
    margin: '0 2.5rem',
    marginBottom: '1.25em',
    textTransform: 'none',
    padding: 0,
    '&:hover': {
      backgroundColor: 'transparent'
    }
  },
  flag: {
    height: '2.375rem',
    width: '2.375rem',
    backgroundColor: 'gray',
    marginRight: '0.625rem'
  }
});
function DataByTopic({ classes }) {
  return (
    <Grid container direction="row" justify="center" className={classes.root}>
      <Grid item container md={3}>
        <div>
          <Typography variant="h2" color="textSecondary">
            Data By Topic
          </Typography>
          <Typography variant="body2" color="textSecondary">
            Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum
            dolor sit amet.
          </Typography>
        </div>
      </Grid>
      <Grid item container md={9} direction="row" wrap="wrap">
        {new Array(10).fill(undefined).map(() => (
          <Button
            disableRipple
            disableFocusRipple
            disableTouchRipple
            className={classes.countryButton}
          >
            <img alt="" className={classes.flag} />
            <Typography color="textSecondary">Country Name</Typography>
          </Button>
        ))}
      </Grid>
    </Grid>
  );
}

DataByTopic.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(DataByTopic);
