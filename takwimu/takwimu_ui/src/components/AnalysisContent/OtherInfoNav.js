import React from 'react';

import { withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import AnalysisContentNavigation from './ContentNavigation';

import Layout from '../Layout';

const styles = theme => ({
  root: {
    position: 'fixed',
    top: 0,
    left: 0,
    width: '100%',
    height: '100px',
    display: 'flex',
    justifyContent: 'center',
    zIndex: 2, // Ensure its ontop (data continer actions has index 1)
    backgroundColor: theme.palette.primary.main
  },
  otherTopicLinks: {
    '& > button:nth-child(n)': {
      marginRight: '3.125rem'
    }
  },
  otherTopic: {
    color: 'white',
    textDecoration: 'underline'
  },
  label: {
    color: 'white',
    fontSize: '0.813rem',
    marginTop: '1rem',
    marginBottom: '0.5rem'
  },
  navigation: {
    backgroundColor: 'unset',
    padding: 0,
    [theme.breakpoints.up('md')]: {
      width: '100%'
    },
    [theme.breakpoints.up('lg')]: {
      width: '100%'
    }
  }
});

function OtherInfoNav({
  labelText,
  labelTextStrong,
  classes,
  content,
  current,
  showContent
}) {
  return (
    <div className={classes.root}>
      <Layout>
        <AnalysisContentNavigation
          classes={{ root: classes.navigation, label: classes.label }}
          labelText={labelText}
          labelTextStrong={labelTextStrong}
          current={current}
          content={content}
          showContent={showContent}
          linksPrimaryColor="textSecondary"
          linksSecondaryColor="textSecondary"
        />
      </Layout>
    </div>
  );
}

OtherInfoNav.propTypes = {
  labelText: PropTypes.string.isRequired,
  labelTextStrong: PropTypes.string.isRequired,
  classes: PropTypes.shape({}).isRequired,
  current: PropTypes.number.isRequired,
  content: PropTypes.shape({}).isRequired,
  showContent: PropTypes.func.isRequired
};

export default withStyles(styles)(OtherInfoNav);
