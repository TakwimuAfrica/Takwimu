import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, Typography } from '@material-ui/core';

const styles = theme => ({
  root: {
    width: '100%'
  },
  title: {
    fontWeight: 'normal'
  },
  description: {
    marginTop: '2.6875rem',
    padding: '1.3125rem 2rem 1.5625rem 2.125rem',
    backgroundColor: theme.palette.info.main
  }
});

function Error({ children, classes, title, ...props }) {
  return (
    <div className={classes.root} {...props}>
      <Typography variant="h1" className={classes.title}>
        {title}
      </Typography>
      <div className={classes.description}>{children}</div>
    </div>
  );
}

Error.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]).isRequired,
  title: PropTypes.string
};
Error.defaultProps = {
  title: ''
};

export default withStyles(styles)(Error);
