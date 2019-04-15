import React from 'react';

import { ButtonBase, Typography, withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import shareIcon from '../../../assets/images/analysis/share.svg';
import downloadIcon from '../../../assets/images/analysis/download.svg';

const styles = {
  root: {
    padding: '30px',
    display: 'flex',
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
    fontStyle: 'italic'
  },
  shareButton: {
    fontSize: '0.813rem',
    color: '#848484'
  }
};

function Actions({ classes, hideLastUpdated }) {
  return (
    <div className={classes.root}>
      {!hideLastUpdated && (
        <Typography className={classes.lastUpdated}>
          Last Updated: <strong>18th December 2018</strong>
        </Typography>
      )}
      <ButtonBase className={classes.shareButton}>
        <img alt="share" src={shareIcon} className={classes.actionIcon} />
        Share this analysis
      </ButtonBase>
      <ButtonBase className={classes.shareButton}>
        <img alt="download" src={downloadIcon} className={classes.actionIcon} />
        Download this analysis (PDF 800kb)
      </ButtonBase>
    </div>
  );
}

Actions.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  hideLastUpdated: PropTypes.isRequired
};

export default withStyles(styles)(Actions);
