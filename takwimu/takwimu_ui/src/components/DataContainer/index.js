/* eslint-disable react/no-danger */
import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Typography, Grid } from '@material-ui/core';
import { ArrowDropUp } from '@material-ui/icons';

import classNames from 'classnames';
import EntitiesDataContainer from './EntitiesDataContainer';
import FeaturedDataContainer from './FeaturedDataContainer';
import HTMLDataContainer from './HTMLDataContainer';
import PDFDataContainer from './PDFDataContainer';

const styles = theme => ({
  root: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '50%',
      padding: '0.625rem'
    }
  },
  layoutFull: {
    width: '100%'
  },
  dataContainer: {
    padding: '0.625rem',
    backgroundColor: theme.palette.data.light,
    overflow: 'hidden',
    [theme.breakpoints.up('md')]: {
      padding: '1.25rem'
    }
  },
  descriptionWrapper: {
    marginTop: '1.25rem',
    marginLeft: 'auto',
    marginRight: 'auto'
  },
  descriptionContainer: {
    width: 'auto'
  },
  description: {
    color: theme.palette.data.main,
    marginLeft: '1.25rem',
    [theme.breakpoints.up('md')]: {
      width: '17.53125rem' // .75 of lg
    },
    [theme.breakpoints.up('md')]: {
      width: '23.375rem'
    }
  },
  title: {
    fontWeight: 'bold',
    lineHeight: 1.2,
    marginBottom: '0.625rem'
  }
});

function DataContainer({ id, classes, data }) {
  return (
    <div
      className={classNames(classes.root, {
        [classes.layoutHalf]: data.value.layoutFull === 'full'
      })}
    >
      <div className={classes.dataContainer}>
        <Grid container direction="column" alignItems="center">
          <Typography variant="body1" align="center" className={classes.title}>
            {data.value.title}
          </Typography>

          {data.type === 'featured_data_widget' && (
            <FeaturedDataContainer data={data.value} />
          )}

          {data.type === 'html' && (
            <HTMLDataContainer id={id} data={data.value} />
          )}

          {data.type === 'entities' && (
            <EntitiesDataContainer id={id} data={data.value} />
          )}

          {data.type === 'document' && (
            <PDFDataContainer id={id} data={data.value} />
          )}
        </Grid>
      </div>

      {data.value.description && (
        <div className={classes.descriptionWrapper}>
          <Grid
            container
            justify="center"
            alignItems="flex-start"
            wrap="nowrap"
            className={classes.descriptionContainer}
          >
            <Grid item>
              <ArrowDropUp color="primary" />
            </Grid>
            <Grid item>
              <Typography variant="caption" className={classes.description}>
                {data.value.description}
              </Typography>
            </Grid>
          </Grid>
        </div>
      )}
    </div>
  );
}

DataContainer.propTypes = {
  id: PropTypes.string,
  classes: PropTypes.shape({}).isRequired,
  data: PropTypes.shape({}).isRequired
};

DataContainer.defaultProps = {
  id: ''
};

export default withStyles(styles)(DataContainer);
