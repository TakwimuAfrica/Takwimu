import React from 'react';
import PropTypes from 'prop-types';
import { Typography, withStyles } from '@material-ui/core';

const styles = theme => ({
  root: {
    margin: '0 auto',
    [theme.breakpoints.up('md')]: {
      width: '58.265625rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '77.6875rem'
    }
  },
  title: {
    [theme.breakpoints.up('md')]: {
      width: '51.125rem'
    }
  }
});

function Section({ children, classes, title, variant }) {
  return (
    <div className={classes.root}>
      {title && (
        <Typography variant={variant} className={classes.title}>
          {title}
        </Typography>
      )}
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
  title: PropTypes.string,
  variant: PropTypes.string
};

Section.defaultProps = {
  title: null,
  variant: 'h2'
};

export default withStyles(styles)(Section);
