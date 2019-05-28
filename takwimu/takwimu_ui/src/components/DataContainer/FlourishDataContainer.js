/* eslint-disable react/no-danger */
import React, { Fragment, useEffect, useState } from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, withTheme } from '@material-ui/core/styles';

import DataActions from './DataActions';
import { shareIndicator, uploadImage } from './common';

const styles = {
  root: {
    width: '100%'
  }
};

function DataContainer({ id, classes, data, theme }) {
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

  const toCanvas = () => {
    const iframe = document.getElementById(`data-indicator-${id}`);
    return iframe.contentWindow.html2canvas(iframe.contentDocument.body);
  };

  const handleDownload = () => {
    toCanvas().then(canvas => {
      const link = document.createElement('a');
      link.download = `${data.title}.png`;
      link.target = '_blank';
      link.href = canvas.toDataURL('image/png');
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    });
  };

  const handleShare = () => {
    toCanvas().then(canvas => {
      uploadImage(id, canvas.toDataURL('image/png')).then(success => {
        if (success) {
          shareIndicator(id);
        }
      });
    });
  };

  const updateIframe = (iframe, chart) => {
    /* eslint-disable no-param-reassign */
    const { offsetHeight } = chart;
    iframe.style.height = `${offsetHeight}px`;
    iframe.contentDocument.body.style.fontFamily = theme.typography.fontText;
    iframe.contentDocument.body.style.background = 'rgb(0,0,0) !important';
    const headers = iframe.contentDocument.getElementsByClassName(
      'flourish-header'
    );
    if (headers && headers.length) {
      headers[0].style.display = 'none';
    }

    // Sometimes chart come with `Show full visualization` button
    const expandEmbed = iframe.contentDocument.getElementById('expand-embed');
    if (expandEmbed) {
      expandEmbed.style.backgroundColor = theme.palette.data.light;
    }
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
      updateIframe(iframe, iframe.contentDocument.getElementById('wrapper'));
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

    // Override `body` inline style
    const style = iframe.contentDocument.createElement('style');
    style.type = 'text/css';
    style.append('body[style] { background: none !important; }');
    frameHead.appendChild(style);
  };

  if (animated) {
    const iframe = document.getElementById(`data-indicator-${id}`);
    updateIframe(iframe, iframe.contentDocument.getElementById(animatedId));
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
      <DataActions
        onDownload={handleDownload}
        embedCode={embedCode}
        onShare={handleShare}
      />
    </Fragment>
  );
}

DataContainer.propTypes = {
  id: PropTypes.string,
  classes: PropTypes.shape({}).isRequired,
  data: PropTypes.shape({}).isRequired,
  theme: PropTypes.shape({}).isRequired
};

DataContainer.defaultProps = {
  id: ''
};

export default withTheme()(withStyles(styles)(DataContainer));
