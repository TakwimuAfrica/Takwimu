/* eslint-disable react/no-danger */
import React, { useState, useEffect, Fragment } from 'react';
import { PropTypes } from 'prop-types';

import { withStyles } from '@material-ui/core';

import DataActions from './DataActions';
import { RichTypography } from '../core';

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

  return (
    <Fragment>
      {data.entities.map(entity => (
        <div id={`data-indicator-${id}`} className={classes.root}>
          {entity.image && <img alt="" src={images[entity.image]} />}
          <RichTypography component="div">{entity.description}</RichTypography>
        </div>
      ))}
      <DataActions title={data.title} />
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
