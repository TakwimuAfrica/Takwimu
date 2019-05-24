import React from 'react';
import { PropTypes } from 'prop-types';

import { Typography, withStyles } from '@material-ui/core';

const styles = theme => ({
  root: {
    '& a': {
      color: theme.palette.primary.main
    }
  }
});

function RichTypography({ classes, children, variant, ...props }) {
  if (!children) {
    return null;
  }

  return (
    <Typography
      variant={variant}
      className={classes.root}
      dangerouslySetInnerHTML={{
        __html: children
      }}
      {...props}
    />
  );
}

RichTypography.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  children: PropTypes.string,
  variant: PropTypes.string
};

RichTypography.defaultProps = {
  children: null,
  variant: 'body1'
};

export default withStyles(styles)(RichTypography);
