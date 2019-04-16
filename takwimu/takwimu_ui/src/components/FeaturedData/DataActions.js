import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, IconButton, Typography, Grid } from '@material-ui/core';

import shareIcon from '../../assets/images/network-connection.svg';
import embedIcon from '../../assets/images/code.svg';
import compareIcon from '../../assets/images/compare.svg';
import downloadIcon from '../../assets/images/download.svg';
import showIcon from '../../assets/images/tablet-reader-31.svg';

const styles = () => ({
  root: {
    backgroundColor: 'white',
    borderRadius: '0.625rem',
    width: 'fit-content',
    clear: 'both',
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    marginTop: '2rem', // Separate it from Viz
    zIndex: '1' // Ensure it appears on top of Viz
  },
  button: {
    borderRadius: '0',
    '&:hover': {
      backgroundColor: 'transparent'
    }
  },
  actionText: {
    fontFamily: 'Muli',
    fontSize: '0.6rem',
    fontWeight: 'bold',
    fontStyle: 'normal',
    fontStretch: 'normal',
    lineHeight: 'normal',
    letterSpacing: '0.019rem'
  },
  verticalDivider: {
    width: '0.07rem',
    height: '1.913rem',
    backgroundColor: '#eaeaea'
  }
});

function ActionButtonComponent({ classes, children, onClick }) {
  return (
    <IconButton
      disableRipple
      disableTouchRipple
      className={classes.button}
      onClick={onClick}
    >
      <Grid
        component="span"
        container
        direction="column"
        justify="center"
        alignItems="center"
      >
        {children}
      </Grid>
    </IconButton>
  );
}

ActionButtonComponent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  onClick: PropTypes.func,
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]).isRequired
};

ActionButtonComponent.defaultProps = {
  onClick: () => {}
};

const ActionButton = withStyles(styles)(ActionButtonComponent);

function DataActions({ classes, onDownload }) {
  return (
    <div className={classes.root}>
      <ActionButton>
        <img alt="" src={shareIcon} />
        <Typography className={classes.actionText}>Share</Typography>
      </ActionButton>
      <div className={classes.verticalDivider} />
      <ActionButton onClick={onDownload}>
        <img alt="" src={downloadIcon} />
        <Typography className={classes.actionText}>Download</Typography>
      </ActionButton>
      <div className={classes.verticalDivider} />
      <ActionButton>
        <img alt="" src={embedIcon} />
        <Typography className={classes.actionText}>Embed</Typography>
      </ActionButton>
      <div className={classes.verticalDivider} />
      <ActionButton>
        <img alt="" src={compareIcon} />
        <Typography className={classes.actionText}>Compare</Typography>
      </ActionButton>
      <div className={classes.verticalDivider} />
      <ActionButton>
        <img alt="" src={showIcon} />
        <Typography className={classes.actionText}>Show Data</Typography>
      </ActionButton>
    </div>
  );
}

DataActions.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  onDownload: PropTypes.func.isRequired
};

export default withStyles(styles)(DataActions);
