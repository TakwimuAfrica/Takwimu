import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles } from '@material-ui/core';

import ContentNavigation from '../ContentNavigation';

const styles = () => ({
  root: {}
});

function AboutUsContentNavigation({
  classes,
  current,
  contentHeadings,
  changeActiveContent
}) {
  const generateHref = index => {
    const item = contentHeadings[index];
    return `#${item.link}`;
  };
  const generateTitle = index => contentHeadings[index].title;

  return (
    <ContentNavigation
      classes={{ root: classes.root }}
      title="On this page"
      content={contentHeadings}
      current={current}
      generateHref={generateHref}
      generateTitle={generateTitle}
      onClick={changeActiveContent}
    />
  );
}

AboutUsContentNavigation.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  current: PropTypes.number.isRequired,
  contentHeadings: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  changeActiveContent: PropTypes.func.isRequired
};

export default withStyles(styles)(AboutUsContentNavigation);
