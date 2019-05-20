/* eslint-disable react/no-danger */
import React, { Fragment } from 'react';
import { PropTypes } from 'prop-types';

import { withStyles } from '@material-ui/core';

import DataActions from './DataActions';
import { getShareHandler } from './common';

const styles = {
  root: {
    width: '100%'
  }
};

function DataContainer({ id, classes, data }) {
  return (
    <Fragment>
      <div id={`data-indicator-${id}`} className={classes.root}>
        <div dangerouslySetInnerHTML={{ __html: data.raw_html }} />
      </div>
      <DataActions onShare={getShareHandler(id, data.title, data.summary)} />
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
