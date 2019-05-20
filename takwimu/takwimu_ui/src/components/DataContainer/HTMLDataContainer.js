/* eslint-disable react/no-danger */
import React, { Fragment } from 'react';
import { PropTypes } from 'prop-types';

import { withStyles } from '@material-ui/core';

import DataActions from './DataActions';

const styles = {
  root: {
    width: '100%'
  }
};

function DataContainer({ id, classes, data }) {
  const handleShare = () => {
    window.open(
      `https://twitter.com/intent/tweet?url=${encodeURI(
        `${window.location.href}?indicator=${id}`
      )}`
    );
  };
  return (
    <Fragment>
      <div id={`data-indicator-${id}`} className={classes.root}>
        <div dangerouslySetInnerHTML={{ __html: data.raw_html }} />
      </div>
      <DataActions onShare={handleShare} />
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
