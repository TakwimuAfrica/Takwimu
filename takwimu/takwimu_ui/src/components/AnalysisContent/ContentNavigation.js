import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles } from '@material-ui/core';

import ContentNavigation from '../ContentNavigation';

const styles = () => ({
  root: {}
});

function AnalysisContentNavigation({
  classes,
  labelText,
  labelTextStrong,
  current,
  content,
  showContent
}) {
  const generateHref = index => {
    const item = content.body[index];
    return `#${item.id}`;
  };
  const generateTitle = index => {
    const item = content.body[index];
    return item.value.title;
  };

  return (
    <ContentNavigation
      classes={{ root: classes.root }}
      title={labelText}
      contentTitle={labelTextStrong}
      content={content.body}
      current={current}
      generateHref={generateHref}
      generateTitle={generateTitle}
      onClick={showContent}
    />
  );
}

AnalysisContentNavigation.propTypes = {
  labelText: PropTypes.string.isRequired,
  labelTextStrong: PropTypes.string.isRequired,
  classes: PropTypes.shape({}).isRequired,
  current: PropTypes.number.isRequired,
  content: PropTypes.shape({}).isRequired,
  showContent: PropTypes.func.isRequired
};

export default withStyles(styles)(AnalysisContentNavigation);
