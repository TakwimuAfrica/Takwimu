import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Typography } from '@material-ui/core';

import ContentNavigation from './ContentNavigation';
import ContentSection from '../ContentSection';
import LegalContentNav from './LegalContentNav';
import RelatedContent from '../RelatedContent';
import RichTextSection from '../RichTextSection';

const styles = theme => ({
  root: {
    maxWidth: '58.313rem'
  },
  title: {
    marginBottom: '1.375rem',
    padding: '0 0.75rem'
  },
  body: {
    padding: '0 1.188rem'
  },
  section: {
    marginTop: '2.5rem',
    paddingTop: '1rem',
    paddingBottom: '1rem',
    borderTop: `4px solid ${theme.palette.primary.main}`
  },
  social: {
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    '&:not(:last-child)': {
      marginRight: '3.125rem'
    },
    '& > :first-child': {
      marginRight: '0.625rem'
    }
  },
  keyContacts: {
    '& > :not(:last-child)': {
      marginBottom: '2.5rem'
    }
  },
  whereToNext: {
    marginTop: '7.75rem'
  }
});

function LegalContent({
  classes,
  title,
  navigationTitle,
  contents,
  current,
  contentHeadings,
  changeActiveContent,
  relatedContent
}) {
  return (
    <React.Fragment>
      <LegalContentNav
        title={navigationTitle}
        current={current}
        contentHeadings={contentHeadings}
        changeActiveContent={index => () => changeActiveContent(index)}
      />
      <Typography variant="h2" className={classes.title}>
        {title}
      </Typography>
      <ContentNavigation
        title={navigationTitle}
        contentHeadings={contentHeadings}
        current={current}
        changeActiveContent={index => () => changeActiveContent(index)}
      />
      {contents.map(({ value: content }, i) => (
        <RichTextSection
          id={contentHeadings[i].link}
          classes={{ root: classes.section }}
          title={content.title}
          value={content.description}
          component={ContentSection}
        />
      ))}
      <RelatedContent content={relatedContent} />
    </React.Fragment>
  );
}

LegalContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  title: PropTypes.string.isRequired,
  navigationTitle: PropTypes.string.isRequired,
  contents: PropTypes.arrayOf(PropTypes.shape({})).isRequired,
  contentHeadings: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  current: PropTypes.number.isRequired,
  changeActiveContent: PropTypes.func.isRequired,
  relatedContent: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(LegalContent);
