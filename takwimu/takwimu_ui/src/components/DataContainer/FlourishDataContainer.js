/* eslint-disable react/no-danger */
import React, { Fragment, useEffect, useState } from 'react';
import { PropTypes } from 'prop-types';

import { withStyles } from '@material-ui/core';

import DataActions from './DataActions';

const styles = {
  root: {
    width: '100%'
  }
};

function DataContainer({ id, classes, data }) {
  const [animated, setAnimated] = useState(false);
  const [animatedId, setAnimatedId] = useState('');

  useEffect(
    () => {
      let timer1;
      if (animated) {
        timer1 = setTimeout(() => setAnimated(true), 1000);
      }

      return () => {
        if (timer1) {
          clearTimeout(timer1);
        }
      };
    },
    [animated] // useEffect will run only one time
  );

  const handleDownload = () => {
    const iframe = document.getElementById(`data-indicator-${id}`);
    iframe.contentWindow
      .html2canvas(iframe.contentDocument.body)
      .then(canvas => {
        const link = document.createElement('a');
        link.download = `${data.title}.png`;
        link.target = '_blank';
        link.href = canvas.toDataURL('image/png');
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
      });
  };

  const updateIframeHeight = chart => {
    const { offsetHeight } = chart;
    const iframe = document.getElementById(`data-indicator-${id}`);
    iframe.style.height = `${offsetHeight}px`;
  };

  const handleIframeLoaded = e => {
    const iframe = e.target;
    // It's possible we'll come across different ids in the future so lets
    // store the id name in component state as well for easier lookup.
    const popUp = iframe.contentDocument.getElementById(
      'flourish-popup-constrainer'
    );
    if (popUp) {
      setAnimated(true);
      setAnimatedId('flourish-popup-constrainer');
    } else {
      updateIframeHeight(iframe.contentDocument.getElementById('wrapper'));
    }

    // Add htm2canvas
    const frameHead = iframe.contentDocument
      .getElementsByTagName('head')
      .item(0);
    const script = iframe.contentDocument.createElement('script');
    script.type = 'text/javascript';
    script.src =
      'https://cdn.jsdelivr.net/npm/html2canvas@1.0.0-rc.1/dist/html2canvas.min.js';
    frameHead.appendChild(script);
  };

  if (animated) {
    const iframe = document.getElementById(`data-indicator-${id}`);
    updateIframeHeight(iframe.contentDocument.getElementById(animatedId));
  }

  const embedCode = `<iframe title="${data.title}"
 frameborder="0"
 scrolling="no"
 src="https://takwimu.africa/flourish/${data.html}" />`;

  return (
    <Fragment>
      <iframe
        id={`data-indicator-${id}`}
        frameBorder="0"
        scrolling="no"
        title={data.title}
        src={`/flourish/${data.html}`}
        onLoad={handleIframeLoaded}
        className={classes.root}
      />
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
