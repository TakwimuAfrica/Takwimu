import React, { useState, useEffect } from 'react';

import { withStyles, ButtonBase, Grid, Typography } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import { TwitterShareButton } from 'react-share';

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
  hideLastUpdated,
  title,
  pdfBlob
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

  return (
    <div className={classes.root}>
      {!hideLastUpdated && (
        <Typography className={classes.lastUpdated}>
          Last Updated: <strong>{lastUpdated}</strong>
        </Typography>
      )}

      <TwitterShareButton url={analysisLink}>
        <Grid
          container
          alignItems="center"
          className={classes.shareButtonContainer}
        >
          <img alt="share" src={shareIcon} className={classes.actionIcon} />
          <Typography className={classes.buttonText}>
            Share this analysis
          </Typography>
        </Grid>
      </TwitterShareButton>
      <ButtonBase
        disableRipple
        disableTouchRipple
        className={classes.buttonText}
        onClick={() => {
          if (pdfBlob) {
            const link = document.createElement('a');
            link.href = URL.createObjectURL(pdfBlob);
            link.download = `${title}.pdf`;
            link.target = '_blank';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
            URL.revokeObjectURL(pdfBlob);
          }
        }}
      >
        <img alt="download" src={downloadIcon} className={classes.actionIcon} />
        Download this analysis (PDF{' '}
        {pdfBlob && (pdfBlob.size / 1000).toFixed(1)}kb)
      </ButtonBase>
    </div>
  );
}

Actions.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  page: PropTypes.shape({
    last_published_at: PropTypes.string
  }).isRequired,
  hideLastUpdated: PropTypes.bool,
  title: PropTypes.string.isRequired,
  pdfBlob: PropTypes.shape({})
};

Actions.defaultProps = {
  hideLastUpdated: false,
  pdfBlob: null
};

export default withStyles(styles)(Actions);
