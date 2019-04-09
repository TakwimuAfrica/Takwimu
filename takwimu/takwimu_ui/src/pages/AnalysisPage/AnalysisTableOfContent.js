import React from 'react';
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core';

import { CountrySelector } from '../../components/ProfileDetail';

const styles = theme => ({
  root: {
    position: 'relative',
    display: 'flex',
    justifyContent: 'flex-start',
    width: '100%',
    height: '34rem',
    padding: '1.438rem',
    flexDirection: 'column',
    alignItems: 'flex-start',
    [theme.breakpoints.up('md')]: {
      position: 'fixed',
      width: '14.375rem'
    }
  }
});

function AnalysisTableOfContent({ classes, content }) {
  return (
    <div className={classes.root}>
      <CountrySelector countryName={content.title} />
    </div>
  );
}

AnalysisTableOfContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  content: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(AnalysisTableOfContent);
