import React, { useEffect } from 'react';
import PropTypes from 'prop-types';

import {
  withStyles,
  Grid,
  Link,
  Typography,
  ButtonBase,
  withWidth
} from '@material-ui/core';

import { isWidthDown } from '@material-ui/core/withWidth';
import { RichTypography } from '../core';

const flagSrc = require.context('../../assets/images/flags', false, /\.svg$/);

const styles = theme => ({
  root: {
    display: 'flex',
    padding: '0 1.25rem',
    justifyContent: 'center',
    backgroundColor: theme.palette.primary.main
  },
  container: {
    [theme.breakpoints.up('md')]: {
      width: '58.265625rem', // .75 of lg
      paddingTop: '1.5rem',
      paddingLeft: '1.5rem',
      paddingBottom: '0.75rem'
    },
    [theme.breakpoints.up('lg')]: {
      width: '80.6875rem'
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
  flagsContainer: {
    overflow: 'auto',
    justifyContent: 'space-between',
    [theme.breakpoints.up('sm')]: {
      overflow: 'visible',
      justifyContent: 'unset'
    },
    [theme.breakpoints.up('md')]: {
      paddingLeft: '1.5rem'
    }
  },
  countryLink: {
    display: 'flex',
    alignItems: 'center',
    // Override original takwimu.css & Bootstrap styles
    '&:hover': {
      color: theme.palette.text.secondary,
      textDecoration: 'none'
    }
  },
  countryName: {
    borderBottom: '1px solid',
    lineHeight: 'unset'
  },
  leftContent: {
    height: 'fit-content',
    marginBottom: '1.25rem',
    [theme.breakpoints.up('md')]: {
      height: '15.625rem',
      marginBottom: '0'
    },

    // Override takwimu.css styles
    '& p': {
      fontSize: theme.typography.body2.fontSize
    }
  },
  title: {
    marginBottom: '1.25rem'
  }
});

function DropDownContent({
  classes,
  width,
  title,
  description,
  countries,
  profile
}) {
  useEffect(() => {
    /**
     * Fix flagsContainer height to avoid modal overflow
     */
    if (isWidthDown('xs', width)) {
      const container = document.getElementById('flagsContainer');
      if (container) {
        const rect = container.getBoundingClientRect();
        container.style.setProperty(
          'height',
          `${window.innerHeight - rect.y}px`
        );
      }
    }
  });
  return (
    <div className={classes.root}>
      <Grid container direction="row" className={classes.container}>
        <Grid item container md={3}>
          <div className={classes.leftContent}>
            <Typography
              className={classes.title}
              variant="h4"
              color="textSecondary"
            >
              {title}
            </Typography>

            <RichTypography
              variant="body2"
              color="textSecondary"
              component="div"
            >
              {description}
            </RichTypography>
          </div>
        </Grid>
        <Grid
          item
          md={9}
          container
          wrap="wrap"
          direction="row"
          id="flagsContainer"
          className={classes.flagsContainer}
        >
          {countries.map(country => (
            <ButtonBase
              key={country.slug}
              disableRipple
              disableTouchRipple
              className={classes.countryButton}
            >
              <Link
                href={`/profiles/${profile(country)}`}
                color="textSecondary"
                className={classes.countryLink}
                underline="none"
              >
                <img
                  alt={country.name}
                  src={flagSrc(`./${country.slug}.svg`)}
                  className={classes.flag}
                />
                <span className={classes.countryName}>
                  {country.short_name}
                </span>
              </Link>
            </ButtonBase>
          ))}
        </Grid>
      </Grid>
    </div>
  );
}

DropDownContent.propTypes = {
  width: PropTypes.string.isRequired,
  classes: PropTypes.shape({}).isRequired,
  countries: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  title: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  profile: PropTypes.func.isRequired
};

export default withWidth()(withStyles(styles)(DropDownContent));
