/* eslint-disable react/no-danger */
import React, { Fragment } from 'react';
import { PropTypes } from 'prop-types';

import { withStyles } from '@material-ui/core';

import domtoimage from 'dom-to-image';
import DataActions from './DataActions';

const styles = {
  root: {
    width: '100%'
  }
};

function DataContainer({ id, classes, data }) {
  const handleDownload = () => {
    const el = document.getElementById(`data-indicator-${id}`);
    domtoimage.toPng(el).then(dataUrl => {
      const link = document.createElement('a');
      link.download = `${data.value.title}.png`;
      link.href = dataUrl;
      link.click();
    });
  };

  const embedCode = data.raw_html;

  return (
    <Fragment>
      <div id={`data-indicator-${id}`} className={classes.root}>
        <div dangerouslySetInnerHTML={{ __html: data.raw_html }} />
      </div>
      <DataActions onDownload={handleDownload} embedCode={embedCode} />
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
