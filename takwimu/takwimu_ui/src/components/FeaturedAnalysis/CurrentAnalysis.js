import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Button, Grid, Typography } from '@material-ui/core';

const flagSrc = require.context('../../assets/images/flags', false, /\.svg$/);

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
    backgroundColor: theme.palette.info.main,
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
    height: '4.4375rem',
    marginRight: '1.5rem'
  },
  title: {
    margin: 0
  },
  body: {
    paddingBottom: '1.875rem',
    lineHeight: 1.55
  },
  actions: {
    marginBottom: '3.0625rem'
  },
  primaryAction: {
    // Override original Takwimu & Bootstrap styles
    '&:hover': {
      color: theme.palette.text.secondary,
      textDecoration: 'none'
    }
  },
  secondaryAction: {
    marginTop: '1rem',
    padding: 0,
    borderWidth: '0.125rem',
    [theme.breakpoints.up('md')]: {
      marginTop: 0,
      marginLeft: '2.15625rem' // .75 lg
    },
    [theme.breakpoints.up('lg')]: {
      marginLeft: '2.875rem'
    },

    // Override original Takwimu & Bootstrap styles
    '&:hover': {
      color: theme.palette.primary.dark,
      textDecoration: 'none'
    }
  },
  // override label padding for secondary button/ allow for the 2px border
  secondaryActionLabel: {
    paddingTop: '1rem',
    paddingBottom: '0.9375rem'
  }
});

function CurrentAnalysis({
  classes,
  content: { value: currentAnalysis },
  readAnalysisTitle,
  viewProfileTitle
}) {
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
            <img
              src={flagSrc(`./${currentAnalysis.country.slug}.svg`)}
              alt="South Africa"
              className={classes.flag}
            />
            <Typography
              variant="h4"
              component="h1"
              className={classes.title}
              dangerouslySetInnerHTML={{ __html: currentAnalysis.title }}
            />
          </Grid>
        </Grid>
        <Grid item xs={12}>
          <Typography
            variant="body1"
            className={classes.body}
            dangerouslySetInnerHTML={{ __html: currentAnalysis.description }}
          />
        </Grid>
        <Grid item xs={12}>
          <Grid
            container
            justify="flex-start"
            alignItems="center"
            className={classes.actions}
          >
            <Button
              href={`/profiles/${currentAnalysis.country.slug}/${
                currentAnalysis.slug
              }`}
              className={classes.primaryAction}
            >
              {readAnalysisTitle}
            </Button>
            <Button
              href={`/profiles/country-${currentAnalysis.country.iso_code}-${
                currentAnalysis.country.slug
              }`}
              className={classes.secondaryAction}
              classes={{ label: classes.secondaryActionLabel }}
              variant="outlined"
            >
              {viewProfileTitle}
            </Button>
          </Grid>
        </Grid>
      </Grid>
    </div>
  );
}

CurrentAnalysis.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  content: PropTypes.shape({
    value: PropTypes.shape({}).isRequired
  }).isRequired,
  readAnalysisTitle: PropTypes.string.isRequired,
  viewProfileTitle: PropTypes.string.isRequired
};

export default withStyles(styles)(CurrentAnalysis);
