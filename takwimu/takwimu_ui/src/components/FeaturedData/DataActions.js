import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, IconButton, Typography, Grid } from '@material-ui/core';
import {
  ShareOutlined,
  CloudDownload,
  Code,
  CompareArrows,
  List
} from '@material-ui/icons';

const styles = () => ({
  root: {
    backgroundColor: 'white',
    borderRadius: '0.625rem',
    width: 'fit-content',
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center'
  },
  button: {
    borderRadius: '0',
    '&:hover': {
      backgroundColor: 'transparent'
    }
  },
  verticalDivider: {
    height: '60%',
    width: '1px',
    borderRight: '1px solid #eaeaea'
  }
});

function ActionButtonComponent({ classes, children }) {
  return (
    <IconButton disableRipple disableTouchRipple className={classes.button}>
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
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]).isRequired
};

const ActionButton = withStyles(styles)(ActionButtonComponent);

function DataActions({ classes }) {
  return (
    <div className={classes.root}>
      <ActionButton>
        <ShareOutlined />
        <Typography>Share</Typography>
      </ActionButton>
      <div className={classes.verticalDivider} />
      <ActionButton>
        <CloudDownload />
        <Typography>Download</Typography>
      </ActionButton>
      <div className={classes.verticalDivider} />
      <ActionButton>
        <Code />
        <Typography>Embed</Typography>
      </ActionButton>
      <div className={classes.verticalDivider} />
      <ActionButton>
        <CompareArrows />
        <Typography>Compare</Typography>
      </ActionButton>
      <div className={classes.verticalDivider} />
      <ActionButton>
        <List />
        <Typography>Show Data</Typography>
      </ActionButton>
    </div>
  );
}

DataActions.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(DataActions);
