import React, { useState } from 'react';

import {
  ButtonBase,
  Typography,
  withStyles,
  Popover,
  Paper,
  ClickAwayListener,
  Grid
} from '@material-ui/core';
import { PropTypes } from 'prop-types';

import { TwitterShareButton, TwitterIcon } from 'react-share';

import shareIcon from '../../assets/images/analysis/share.svg';
import downloadIcon from '../../assets/images/analysis/download.svg';

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
  },
  sharePopover: {
    width: '20.313rem',
    padding: '10px'
  }
};

function Actions({ classes, hideLastUpdated }) {
  const [shareButtonElement, setShareButtonElement] = useState(null);
  return (
    <div className={classes.root}>
      {!hideLastUpdated && (
        <Typography className={classes.lastUpdated}>
          Last Updated: <strong>18th December 2018</strong>
        </Typography>
      )}
      <ButtonBase
        disableRipple
        className={classes.shareButton}
        onClick={e => setShareButtonElement(e.target)}
      >
        <img alt="share" src={shareIcon} className={classes.actionIcon} />
        Share this analysis
      </ButtonBase>
      <ButtonBase className={classes.shareButton}>
        <img alt="download" src={downloadIcon} className={classes.actionIcon} />
        Download this analysis (PDF 800kb)
      </ButtonBase>

      <Popover
        open={shareButtonElement !== null}
        anchorEl={shareButtonElement}
        anchorOrigin={{ vertical: -80, horizontal: -80 }}
      >
        <ClickAwayListener onClickAway={() => setShareButtonElement(null)}>
          <Paper className={classes.sharePopover}>
            <Grid container justify="space-between">
              <Typography>Share the link to this analysis:</Typography>
              <TwitterShareButton url={window.location.href}>
                <TwitterIcon size={40} />
              </TwitterShareButton>
            </Grid>
          </Paper>
        </ClickAwayListener>
      </Popover>
    </div>
  );
}

Actions.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  hideLastUpdated: PropTypes.bool,
  takwimu: PropTypes.shape({}).isRequired
};

Actions.defaultProps = {
  hideLastUpdated: false
};

export default withStyles(styles)(Actions);
