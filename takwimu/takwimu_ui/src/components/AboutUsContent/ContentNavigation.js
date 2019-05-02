import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles } from '@material-ui/core';

import ContentNavigation from '../ContentNavigation';

const styles = theme => ({
  root: {},
  label: {
    color: theme.palette.text.secondary
  },
  topicSelected: {
    fontWeight: 'bold'
  }
});

function AboutUsContentNavigation({
  classes,
  current,
  contentHeadings,
  changeActiveContent,
  linksPrimaryColor,
  linksSecondaryColor
}) {
  const generateHref = index => {
    if (index === 0) {
      return `/about`;
    }
    const item = contentHeadings[index];
    return `/about/${item.link}`;
  };
  const generateTitle = index => contentHeadings[index].title;

  return (
    <ContentNavigation
      classes={{
        root: classes.root,
        label: classes.label,
        topicSelected: classes.topicSelected
      }}
      title="On this page"
      content={contentHeadings}
      current={current}
      generateHref={generateHref}
      generateTitle={generateTitle}
      onClick={() => changeActiveContent}
      linksPrimaryColor={linksPrimaryColor}
      linksSecondaryColor={linksSecondaryColor}
    />
  );
}

AboutUsContentNavigation.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  current: PropTypes.number.isRequired,
  contentHeadings: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  changeActiveContent: PropTypes.func.isRequired,
  linksPrimaryColor: PropTypes.string,
  linksSecondaryColor: PropTypes.string
};

AboutUsContentNavigation.defaultProps = {
  linksPrimaryColor: 'primary',
  linksSecondaryColor: 'textPrimary'
};

export default withStyles(styles)(AboutUsContentNavigation);
