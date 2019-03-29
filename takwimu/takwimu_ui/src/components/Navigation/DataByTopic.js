import React from 'react';
import PropTypes from 'prop-types';

import { withStyles, Grid, Typography, ButtonBase } from '@material-ui/core';

import chartBackground from '../../assets/images/a-chart-bg.svg';

const flagSrc = require.context('../../assets/images/flags', false, /\.svg$/);

const styles = theme => ({
  root: {
    display: 'flex',
    padding: '0 1.25rem',
    justifyContent: 'center',
    backgroundColor: theme.palette.primary.main,
    [theme.breakpoints.up('md')]: {
      padding: '0 0 1.5rem 0'
    }
  },
  container: {
    backgroundImage: `url(${chartBackground})`,
    backgroundRepeat: 'no-repeat',
    [theme.breakpoints.up('md')]: {
      width: '58.265625rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '77.6875rem'
    }
  },
  countryButton: {
    height: 'fit-content',
    marginBottom: '1.25em',
    textTransform: 'none',
    padding: 0,
    display: 'flex',
    minWidth: '9rem',
    margin: 0,
    justifyContent: 'left',
    '&:hover': {
      backgroundColor: 'transparent'
    },
    [theme.breakpoints.up('sm')]: {
      minWidth: '11.25rem'
    },
    [theme.breakpoints.up('md')]: {
      margin: '0 1.5rem'
    }
  },
  flag: {
    height: '2.375rem',
    width: '2.375rem',
    marginRight: '0.625rem',
    border: '2px solid white',
    borderRadius: '1.187rem'
  },
  flagName: {
    borderBottom: '1px solid',
    lineHeight: 'unset'
  },
  flagsContainer: {
    justifyContent: 'space-between',
    overflow: 'scroll',
    height: '14.5rem',
    [theme.breakpoints.up('sm')]: {
      justifyContent: 'unset',
      overflow: 'unset',
      height: 'unset'
    }
  },
  leftContent: {
    height: 'fit-content',
    marginBottom: '1.25rem',
    [theme.breakpoints.up('md')]: {
      height: '15.625rem',
      marginBottom: '0'
    }
  },
  title: {
    marginBottom: '1.25rem'
  }
});

function DataByTopic({ classes, countries }) {
  const sortedCountries = countries.sort((a, b) => a.name[0] > b.name[0]);
  return (
    <div className={classes.root}>
      <Grid
        container
        direction="row"
        justify="center"
        className={classes.container}
      >
        <Grid item container md={3}>
          <div className={classes.leftContent}>
            <Typography
              className={classes.title}
              variant="h4"
              color="textSecondary"
            >
              Data by Topic
            </Typography>
            <Typography variant="body2" color="textSecondary">
              Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum
              dolor sit amet.
            </Typography>
          </div>
        </Grid>
        <Grid
          item
          container
          md={9}
          direction="row"
          wrap="wrap"
          className={classes.flagsContainer}
        >
          {sortedCountries.map(country => (
            <ButtonBase
              key={country.slug}
              disableRipple
              disableTouchRipple
              className={classes.countryButton}
            >
              <img
                alt={country.name}
                src={flagSrc(`./${country.slug}.svg`)}
                className={classes.flag}
              />
              <Typography color="textSecondary" className={classes.flagName}>
                {country.short_name}
              </Typography>
            </ButtonBase>
          ))}
        </Grid>
      </Grid>
    </div>
  );
}

DataByTopic.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  countries: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(DataByTopic);
