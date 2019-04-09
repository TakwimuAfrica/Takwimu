import React from 'react';

import { Link, Typography, withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import Layout from '../../components/Layout';

const styles = theme => ({
  root: {
    width: '100%',
    height: '100px',
    display: 'flex',
    justifyContent: 'center',
    position: 'fixed',
    top: 0,
    backgroundColor: theme.palette.primary.main
  },
  otherTopicLinks: {
    '& > a:nth-child(2)': {
      margin: '0 50px'
    }
  }
});

function AnalysisPageNav({ classes }) {
  return (
    <div className={classes.root}>
      <Layout>
        <Typography color="textSecondary">
          Other topics in <strong>Politics</strong>
        </Typography>
        <div className={classes.otherTopicLinks}>
          <Link color="textSecondary" href="x">
            South Africa’s Political System
          </Link>
          <Link color="textSecondary" href="x">
            Politician Profiles
          </Link>
          <Link color="textSecondary" href="x">
            Government Bodies
          </Link>
        </div>
      </Layout>
    </div>
  );
}

AnalysisPageNav.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(AnalysisPageNav);
