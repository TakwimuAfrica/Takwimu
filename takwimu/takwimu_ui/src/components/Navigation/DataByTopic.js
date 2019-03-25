import React from 'react';
import PropTypes from 'prop-types';

import { withStyles, Grid, Typography, ButtonBase } from '@material-ui/core';

import chartBackground from '../../assets/a-chart-bg.svg';

const styles = theme => ({
  root: {
    backgroundColor: theme.palette.primary.main,
    width: '100%',
    height: '15.5rem',
    padding: '0 6.25rem'
  },
  countryButton: {
    margin: '0 2.5rem',
    marginBottom: '1.25em',
    textTransform: 'none',
    padding: 0,
    display: 'flex',
    justifyContent: 'left',
    minWidth: '11.25rem',
    '&:hover': {
      backgroundColor: 'transparent'
    }
  },
  flag: {
    height: '2.375rem',
    width: '2.375rem',
    marginRight: '0.625rem',
    border: '2px solid white',
    borderRadius: '1.187rem'
  },
  leftContent: {
    backgroundImage: `url(${chartBackground})`,
    backgroundRepeat: 'no-repeat'
  },
  title: {
    marginBottom: '1.25rem'
  }
});
function DataByTopic({ classes }) {
  return (
    <Grid container direction="row" justify="center" className={classes.root}>
      <Grid item container md={3}>
        <div className={classes.leftContent}>
          <Typography
            className={classes.title}
            variant="h4"
            color="textPrimary"
          >
            Data by Topic
          </Typography>
          <Typography variant="body2">
            Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum
            dolor sit amet.
          </Typography>
        </div>
      </Grid>
      <Grid item container md={9} direction="row" wrap="wrap">
        {window.countries.map(country => (
          <ButtonBase
            key={country.slug}
            disableRipple
            disableTouchRipple
            className={classes.countryButton}
          >
            <img
              alt={country.name}
              src={`/static/img/flags/${country.slug}.svg`}
              className={classes.flag}
            />
            <Typography>{country.short_name}</Typography>
          </ButtonBase>
        ))}
      </Grid>
    </Grid>
  );
}

DataByTopic.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(DataByTopic);
