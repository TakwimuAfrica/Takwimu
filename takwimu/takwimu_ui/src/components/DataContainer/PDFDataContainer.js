/* eslint-disable react/no-danger */
import React, { useState, useEffect, Fragment } from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, ButtonBase } from '@material-ui/core';
import PDF from 'react-pdf-js';
import leftArrow from '../../assets/images/left-arrow.svg';
import rightArrow from '../../assets/images/right-arrow.svg';

import DataActions from './DataActions';

const styles = {
  root: {
    display: 'flex',
    justifyContent: 'center'
  },
  pageButton: {
    margin: '20px'
  }
};

function DataContainer({ id, classes, data }) {
  const [documents, setDocuments] = useState({});
  const [page, setPage] = useState(1);
  const [numberOfPages, setNumberOfPages] = useState(0);

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

  const handleShare = () => {
    window.open(
      `https://twitter.com/intent/tweet?url=${escape(documents[data.document])}`
    );
  };

  return (
    data.document && (
      <Fragment>
        <div id={`data-indicator-${id}`} className={classes.root}>
          <ButtonBase
            disableRipple
            disableTouchRipple
            disabled={page <= 1}
            className={classes.pageButton}
            onClick={() => setPage(page - 1)}
          >
            <img alt="" src={leftArrow} />
          </ButtonBase>
          {documents[data.document] && (
            <PDF
              scale={1}
              page={page}
              file={documents[data.document]}
              onDocumentComplete={setNumberOfPages}
            />
          )}
          <ButtonBase
            disableRipple
            disableTouchRipple
            disabled={page >= numberOfPages}
            className={classes.pageButton}
            onClick={() => setPage(page + 1)}
          >
            <img alt="" src={rightArrow} />
          </ButtonBase>
        </div>

        <DataActions onDownload={handleDownload} onShare={handleShare} />
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
