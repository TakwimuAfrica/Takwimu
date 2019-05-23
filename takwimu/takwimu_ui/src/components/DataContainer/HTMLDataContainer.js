/* eslint-disable react/no-danger */
import React, { Fragment } from 'react';
import { PropTypes } from 'prop-types';

import { withStyles } from '@material-ui/core';

import domtoimage from 'dom-to-image';
import DataActions from './DataActions';
import { shareIndicator, uploadImage } from './common';

const styles = {
  root: {
    width: '100%'
  }
};

function DataContainer({ id, classes, data }) {
  const containerId = `data-indicator-${id}`;

  const handleShare = () => {
    domtoimage.toPng(document.getElementById(containerId)).then(dataURL => {
      uploadImage(id, dataURL).then(success => {
        if (success) {
          shareIndicator(id);
        }
      });
    });
  };

  return (
    <Fragment>
      <div id={containerId} className={classes.root}>
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
