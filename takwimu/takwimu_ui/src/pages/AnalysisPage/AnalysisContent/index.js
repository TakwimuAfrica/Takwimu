/* eslint-disable react/no-danger */
import React from 'react';
import { Typography, withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import OtherTopics from './OtherTopics';
import Actions from './Actions';

const styles = {
  root: {
    maxWidth: '933px'
  },
  title: {
    margin: '37px 0 22px 19px'
  },
  body: {
    padding: '0 19px'
  }
};

function AnalysisContent({ classes, content }) {
  return (
    <div className={classes.root}>
      <Typography className={classes.title} variant="h2">
        {content.value.title}
      </Typography>
      <OtherTopics />
      <Actions />
      <Typography
        className={classes.body}
        dangerouslySetInnerHTML={{ __html: content.value.body }}
      />
      <Actions hideLastUpdated />
      <OtherTopics />
    </div>
  );
}

AnalysisContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  content: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(AnalysisContent);
