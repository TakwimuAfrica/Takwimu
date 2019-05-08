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
    // TODO:
  };

  return (
    <Fragment>
      {data.document && (
        <div id={`data-indicator-${id}`} className={classes.root}>
          {documents[data.document] && (
            <PDF scale={0.65} file={documents[data.document]} />
          )}
        </div>
      )}
      <DataActions onDownload={handleDownload} embedCode="" />
    </Fragment>
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
