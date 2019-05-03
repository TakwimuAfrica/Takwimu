import React, { createRef } from 'react';
import { withStyles } from '@material-ui/core';

import PropTypes from 'prop-types';
import domtoimage from 'dom-to-image';
import { findDOMNode } from 'react-dom';
import DataActions from './FeaturedData/DataActions';

const styles = {
  root: {
    float: 'right',
    margin: 0,
    marginRight: '0.625rem'
  }
};

function HurumapDataActions({ classes }) {
  const ref = createRef();
  return (
    <DataActions
      ref={ref}
      classes={{ root: classes.root }}
      onDownload={() => {
        // eslint-disable-next-line react/no-find-dom-node
        const actions = findDOMNode(ref.current);
        domtoimage.toJpeg(actions.parentElement.parentElement).then(dataUrl => {
          const link = document.createElement('a');
          link.setAttribute('type', 'hidden');
          link.download = `visual.jpeg`;
          link.href = dataUrl;

          // firefox requires this
          document.body.appendChild(link);
          link.click();
          document.body.removeChild(link);
        });
      }}
    />
  );
}

HurumapDataActions.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(HurumapDataActions);
