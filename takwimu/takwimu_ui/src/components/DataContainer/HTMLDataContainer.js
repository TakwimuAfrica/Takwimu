/* eslint-disable react/no-danger */
import React, { Fragment } from 'react';
import { PropTypes } from 'prop-types';

import { withStyles } from '@material-ui/core';

import DataActions from './DataActions';
import { RichTypography } from '../core';

const styles = {
  root: {
    width: '100%'
  }
};

function DataContainer({ id, classes, data }) {
  return (
    <Fragment>
      <div id={`data-indicator-${id}`} className={classes.root}>
        <RichTypography component="div">{data.raw_html}</RichTypography>
      </div>
      <DataActions />
    </Fragment>
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
