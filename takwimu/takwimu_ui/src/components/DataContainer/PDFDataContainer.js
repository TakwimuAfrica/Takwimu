/* eslint-disable react/no-danger */
import React, { useState, useEffect, Fragment } from 'react';
import { PropTypes } from 'prop-types';

import { withStyles } from '@material-ui/core';

import PDF from 'react-pdf-js';
import DataActions from './DataActions';

const styles = {
  root: {
    width: '25rem'
  }
};

function DataContainer({ id, classes, data }) {
  const [documents, setDocuments] = useState({});

  useEffect(() => {
    if (data.document) {
      fetch(`/api/v2/documents/${data.document}`)
        .then(response => response.json())
        .then(json =>
          setDocuments(prev => ({
            ...prev,
            [json.id]: json.meta.download_url
          }))
        );
    }
    return () => {};
  }, []);

  const handleDownload = () => {
    const link = document.createElement('a');
    link.href = documents[data.document];
    link.download = documents[data.document].split('/').pop();
    link.target = '_blank';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

  return (
    data.document && (
      <Fragment>
        <div id={`data-indicator-${id}`} className={classes.root}>
          {documents[data.document] && (
            <PDF scale={0.65} file={documents[data.document]} />
          )}
        </div>

        <DataActions onDownload={handleDownload} />
      </Fragment>
    )
  );
}

DataContainer.propTypes = {
  id: PropTypes.string,
  data: PropTypes.shape({}).isRequired,
  classes: PropTypes.shape({}).isRequired
};

DataContainer.defaultProps = {
  id: ''
};

export default withStyles(styles)(DataContainer);
