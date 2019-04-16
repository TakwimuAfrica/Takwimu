import React from 'react';
import PropTypes from 'prop-types';

import { withStyles, Link, Tooltip, Typography } from '@material-ui/core';

const styles = theme => ({
  root: {},
  list: {},
  listItem: {
    display: 'block',
    lineHeight: 2.28,
    [theme.breakpoints.up('md')]: {
      width: '28.5rem'
    }
  },
  tooltip: {
    fontSize: theme.typography.caption.fontSize,
    backgroundColor: theme.palette.primary.main
  }
});

function Links({ classes, items }) {
  return (
    <div className={classes.root}>
      <Typography
        variant="body2"
        color="primary"
        className={classes.list}
        component="ul"
      >
        {items.map(item => (
          <li key={item.href}>
            <Tooltip
              title={item.name}
              placement="bottom-start"
              classes={{ tooltip: classes.tooltip }}
            >
              <Link
                href={item.href}
                variant="inherit"
                color="inherit"
                underline="always"
                noWrap
                className={classes.listItem}
              >
                {item.name}
              </Link>
            </Tooltip>
          </li>
        ))}
      </Typography>
    </div>
  );
}

Links.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  items: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired
};

export default withStyles(styles)(Links);
