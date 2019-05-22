import React, { useState, useEffect } from 'react';

import { ButtonBase, Typography, withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import { TwitterShareButton } from 'react-share';

import domtoimage from 'dom-to-image';
import html2canvas from 'html2canvas';
import JSPDF from 'jspdf';
import shareIcon from '../../assets/images/analysis/share.svg';
import downloadIcon from '../../assets/images/analysis/download.svg';

const styles = {
  root: {
    padding: '30px',
    display: 'flex',
    alignItems: 'center',
    flexDirection: 'row',
    '& > *': {
      marginRight: '50px'
    },
    '& > button:last-child': {
      marginRight: '0'
    }
  },
  actionIcon: {
    marginRight: '21px'
  },
  lastUpdated: {
    fontSize: '0.875rem',
    lineHeight: 'normal',
    fontStyle: 'italic'
  },
  shareButtonContainer: {
    display: 'flex',
    alignItems: 'center',
    cursor: 'pointer'
  },
  buttonText: {
    fontSize: '0.813rem',
    color: '#848484'
  },
  sharePopover: {
    width: '20.313rem',
    padding: '10px'
  }
};

function Actions({
  classes,
  page: { last_published_at: lastUpdated },
  hideLastUpdated
}) {
  const [analysisLink, setAnalysisLink] = useState(window.location.href);

  useEffect(() => {
    function locationHashChanged() {
      setAnalysisLink(window.location.href);
    }

    window.addEventListener('hashchange', locationHashChanged);

    return () => {
      window.removeEventListener('hashchange', locationHashChanged);
    };
  }, []);

  const handleDownload = () => {
    const ignore = [];
    const iframes = document.getElementsByTagName('iframe');
    Array.from(iframes).forEach(iframe => {
      if (iframe.src.indexOf(window.location.origin) !== -1) {
        // const domtoimage = iframe.contentWindow.domtoimage;
        domtoimage.toPng(iframe.contentWindow.body, data => {
          const img = document.createElement('img');
          img.src = data;
          iframe.parentElement.insertBefore(iframe);
        });
      } else {
        ignore.push(iframe);
      }
    });

    const doc = new JSPDF('p', 'mm', 'a4');

    const content = document.getElementById(
      'AnalysisContent--pdf-downloadable'
    );
    Array.from(content.children).forEach(async child => {
      if (child.id.indexOf('--pdf-ignored') === -1) {
        const canvas = await html2canvas(child, { scale: 1 });
        doc.addImage(canvas.toDataURL('image/png'), 0, 0);
      }
    });

    doc.save();
  };

  return (
    <div className={classes.root}>
      {!hideLastUpdated && (
        <Typography className={classes.lastUpdated}>
          Last Updated: <strong>{lastUpdated}</strong>
        </Typography>
      )}

      <TwitterShareButton url={analysisLink}>
        <div
          container
          alignItems="center"
          className={classes.shareButtonContainer}
        >
          <img alt="share" src={shareIcon} className={classes.actionIcon} />
          <Typography className={classes.buttonText}>
            Share this analysis
          </Typography>
        </div>
      </TwitterShareButton>
      <ButtonBase
        disableRipple
        disableTouchRipple
        onClick={handleDownload}
        className={classes.buttonText}
      >
        <img alt="download" src={downloadIcon} className={classes.actionIcon} />
        Download this analysis (PDF 800kb)
      </ButtonBase>
    </div>
  );
}

Actions.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  page: PropTypes.shape({
    last_published_at: PropTypes.string
  }).isRequired,
  hideLastUpdated: PropTypes.bool
};

Actions.defaultProps = {
  hideLastUpdated: false
};

export default withStyles(styles)(Actions);
