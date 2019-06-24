/* eslint-disable react/no-danger */
import React, { Fragment } from 'react';
import { PropTypes } from 'prop-types';

import { withStyles } from '@material-ui/core';

import DataActions from './DataActions';

const styles = {
  root: {
    width: '100%',
    display: 'flex',
    flexGrow: 1,
    justifyContent: 'center',
    '& img': {
      maxWidth: '100%',
      height: 'auto'
    }
  }
};

function DataContainer({
  id,
  classes,
  data: {
    title,
    image: { src }
  }
}) {
  const handleDownload = () => {
    const index = src.lastIndexOf('.');
    const ext = index !== -1 ? src.substring(index + 1) : '';
    const link = document.createElement('a');
    link.download = `${title}.${ext}`;
    link.target = '_blank';
    link.href = src;
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  const handleShare = () => {
    window.open(
      `https://twitter.com/intent/tweet?url=${window.encodeURIComponent(src)}`
    );
  };

  if (!src) {
    return null;
  }

  return (
    <Fragment>
      <div id={`data-indicator-${id}`} className={classes.root}>
        <img alt={title} src={src} />
      </div>
      <DataActions
        title={title}
        onShare={handleShare}
        onDownload={handleDownload}
      />
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
