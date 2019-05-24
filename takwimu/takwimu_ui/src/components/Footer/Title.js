import React from 'react';
import PropTypes from 'prop-types';

import { Typography } from '@material-ui/core';
import { withStyles } from '@material-ui/core/styles';

const styles = () => ({
  text: {
    fontSize: '1.125rem',
    lineHeight: '1.44',
    color: 'white'
  }
});

function Title({ classes, children }) {
  return (
    <Typography variant="subtitle1" className={classes.text}>
      {children}
    </Typography>
  );
}

Title.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]).isRequired
};

export default withStyles(styles)(Title);
