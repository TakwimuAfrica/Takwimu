import React from 'react';
import PropTypes from 'prop-types';
import { Typography, withStyles } from '@material-ui/core';

const styles = {
  root: {
    padding: '1.25rem 6.25rem'
  }
};

function Section({ children, classes, title, titleVariant }) {
  return (
    <div className={classes.root}>
      <Typography variant={titleVariant}>{title}</Typography>
      {children}
    </div>
  );
}

Section.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]).isRequired,
  title: PropTypes.string.isRequired,
  titleVariant: PropTypes.string
};

Section.defaultProps = {
  titleVariant: 'h1'
};

export default withStyles(styles)(Section);
