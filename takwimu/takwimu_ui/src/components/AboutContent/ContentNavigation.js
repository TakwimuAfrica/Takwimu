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

function AboutContentNavigation({
  classes,
  title,
  current,
  contentHeadings,
  changeActiveContent,
  linksPrimaryColor,
  linksSecondaryColor
}) {
  const generateHref = index => {
    const item = contentHeadings[index];
    return `/${item.link}/`;
  };
  const generateTitle = index => contentHeadings[index].title;

  return (
    <ContentNavigation
      classes={{
        root: classes.root,
        label: classes.label,
        topicSelected: classes.topicSelected
      }}
      title={title}
      content={contentHeadings}
      current={current}
      generateHref={generateHref}
      generateTitle={generateTitle}
      onClick={(e, index) => {
        e.preventDefault();

        window.history.pushState(null, '', generateHref(index));
        changeActiveContent(index)();
      }}
      linksPrimaryColor={linksPrimaryColor}
      linksSecondaryColor={linksSecondaryColor}
    />
  );
}

AboutContentNavigation.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  title: PropTypes.string.isRequired,
  current: PropTypes.number.isRequired,
  contentHeadings: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  changeActiveContent: PropTypes.func.isRequired,
  linksPrimaryColor: PropTypes.string,
  linksSecondaryColor: PropTypes.string
};

AboutContentNavigation.defaultProps = {
  linksPrimaryColor: 'primary',
  linksSecondaryColor: 'textPrimary'
};

export default withStyles(styles)(AboutContentNavigation);
