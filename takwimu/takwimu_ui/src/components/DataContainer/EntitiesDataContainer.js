/* eslint-disable react/no-danger */
import React, { useState, useEffect, Fragment } from 'react';
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
  const [images, setImages] = useState({});

  useEffect(() => {
    data.entities.forEach(
      entity =>
        entity.image &&
        fetch(`/api/v2/images/${entity.image}`)
          .then(response => response.json())
          .then(json =>
            setImages(prev => ({
              ...prev,
              [json.id]: json.meta.download_url
            }))
          )
    );

    return () => {};
  }, []);

  const handleDownload = () => {
    const el = document.getElementById(`data-indicator-${id}`);
    domtoimage.toPng(el).then(dataUrl => {
      const link = document.createElement('a');
      link.download = `${data.value.title}.png`;
      link.href = dataUrl;
      link.click();
    });
  };

  return (
    <Fragment>
      {data.entities.map(entity => (
        <div id={`data-indicator-${id}`} className={classes.root}>
          {entity.image && <img alt="" src={images[entity.image]} />}
          <div dangerouslySetInnerHTML={{ __html: entity.description }} />
        </div>
      ))}
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
