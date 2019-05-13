import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles } from '@material-ui/core';

import ContentNavigation from '../ContentNavigation';

const styles = () => ({
  root: {},
  label: {}
});

function AnalysisContentNavigation({
  classes,
  labelText,
  labelTextStrong,
  current,
  content,
  showContent,
  linksPrimaryColor,
  linksSecondaryColor
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
      classes={{
        root: classes.root,
        label: classes.label,
        other: classes.other
      }}
      title={labelText}
      contentTitle={labelTextStrong}
      content={content.body}
      current={current}
      generateHref={generateHref}
      generateTitle={generateTitle}
      onClick={showContent}
      linksPrimaryColor={linksPrimaryColor}
      linksSecondaryColor={linksSecondaryColor}
    />
  );
}

AnalysisContentNavigation.propTypes = {
  labelText: PropTypes.string.isRequired,
  labelTextStrong: PropTypes.string.isRequired,
  classes: PropTypes.shape({}).isRequired,
  current: PropTypes.number.isRequired,
  content: PropTypes.shape({}).isRequired,
  showContent: PropTypes.func.isRequired,
  linksPrimaryColor: PropTypes.string,
  linksSecondaryColor: PropTypes.string
};

AnalysisContentNavigation.defaultProps = {
  linksPrimaryColor: 'primary',
  linksSecondaryColor: 'textPrimary'
};

export default withStyles(styles)(AnalysisContentNavigation);
