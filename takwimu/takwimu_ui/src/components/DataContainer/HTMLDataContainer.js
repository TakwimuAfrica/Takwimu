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
  const embedCode = data.raw_html;
  const elementId = `data-indicator-${id}`;

  const handleDownload = () => {
    domtoimage
      .toJpeg(document.getElementById(elementId), {
        filter: node => node.id !== 'footer' && node.tagName !== 'IMG'
      })
      .then(dataUrl => {
        const link = document.createElement('a');
        link.download = `${data.title}.jpeg`;
        link.href = dataUrl;
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
      });
  };
  return (
    <Fragment>
      <div
        id={elementId}
        className={classes.root}
        dangerouslySetInnerHTML={{
          __html: data.raw_html
        }}
      />
      <DataActions handleDownload={handleDownload} embedCode={embedCode} />
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
