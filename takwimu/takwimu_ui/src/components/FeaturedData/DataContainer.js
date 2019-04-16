import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Typography, Grid } from '@material-ui/core';
import { ArrowDropUp } from '@material-ui/icons';

import DataActions from './DataActions';
import IFrame from './IFrame';

const styles = theme => ({
  root: {
    margin: '1.25rem 0',
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '28.03125rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '37.375rem'
    }
  },
  dataContainer: {
    padding: '0.625rem',
    backgroundColor: theme.palette.data.light,
    [theme.breakpoints.up('md')]: {
      padding: '1.25rem'
    }
  },
  descriptionContainer: {
    padding: '0 0.625em',
    [theme.breakpoints.up('md')]: {
      padding: '0 2.625rem'
    }
  },
  description: {
    color: theme.palette.data.main,
    marginLeft: '1.25rem'
  }
});

function DataContainer({ classes, featuredData, url }) {
  return (
    <div className={classes.root}>
      <div className={classes.dataContainer}>
        <Grid container direction="column" alignItems="center">
          <IFrame featuredData={featuredData} url={url} />
          <DataActions
            onDownload={() =>
              document
                .getElementById(
                  `cr-embed-country-${featuredData.country}-${
                    featuredData.data_id
                  }`
                )
                .contentWindow.print()
            }
          />
        </Grid>
      </div>
      <div className={classes.descriptionContainer}>
        <Grid container direction="row" wrap="nowrap">
          <Grid item>
            <ArrowDropUp color="primary" />
          </Grid>
          <Grid item>
            <Typography variant="caption" className={classes.description}>
              {featuredData.description}
            </Typography>
          </Grid>
        </Grid>
      </div>
    </div>
  );
}

DataContainer.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  featuredData: PropTypes.shape({}).isRequired,
  url: PropTypes.string.isRequired
};

export default withStyles(styles)(DataContainer);
