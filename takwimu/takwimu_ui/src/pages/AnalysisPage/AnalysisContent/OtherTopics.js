import React from 'react';

import { Link, Typography, withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';

const styles = theme => ({
  root: {
    backgroundColor: theme.palette.info.main,
    padding: '18px 26px'
  },
  otherTopicLinks: {
    '& > a:nth-child(2)': {
      margin: '0 50px'
    }
  }
});

function OtherTopics({ classes }) {
  return (
    <div className={classes.root}>
      <Typography>
        Other topics in <strong>Politics</strong>
      </Typography>
      <div className={classes.otherTopicLinks}>
        <Link color="primary" href="x">
          South Africa’s Political System
        </Link>
        <Link color="primary" href="x">
          Politician Profiles
        </Link>
        <Link color="primary" href="x">
          Government Bodies
        </Link>
      </div>
    </div>
  );
}

OtherTopics.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(OtherTopics);
