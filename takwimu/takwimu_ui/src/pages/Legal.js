import React, { useState, useEffect } from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core';

import ContentPage from '../components/ContentPage';
import LegalContent from '../components/LegalContent';
import TableOfContent from '../components/LegalContent/TableOfContent';

const styles = () => ({
  root: {
    marginTop: '2.875rem',
    marginBottom: '4.375rem'
  }
});

function Legal({
  classes,
  takwimu: {
    page: {
      title,
      content_navigation: {
        value: { title: navigationTitle }
      },
      body: contents,
      active_content: activeContent,
      related_content: relatedContent
    }
  }
}) {
  if (contents.length === 0) {
    return null;
  }

  const [current, setCurrent] = useState(-1);
  const contentHeadings = [];
  const termsIndex = contents.findIndex(c => c.type === 'terms');
  const privacyIndex = contents.findIndex(c => c.type === 'privacy');
  contentHeadings.length = contents.length;
  if (termsIndex !== -1) {
    contentHeadings[termsIndex] = {
      title: contents[termsIndex].value.label,
      link: 'terms'
    };
  }
  if (privacyIndex !== -1) {
    contentHeadings[privacyIndex] = {
      title: contents[privacyIndex].value.label,
      link: 'privacy'
    };
  }

  const changeActiveContent = index => {
    setCurrent(index);
    const activeElement = document.getElementById(contentHeadings[index].link);
    window.scrollTo(0, activeElement.offsetTop - 90);
  };

  useEffect(() => {
    const foundIndex = contentHeadings.findIndex(x => x.link === activeContent);
    if (foundIndex !== -1) {
      changeActiveContent(foundIndex);
    }
  }, []);

  return (
    <ContentPage
      aside={
        <TableOfContent
          current={current}
          contentHeadings={contentHeadings}
          changeActiveContent={changeActiveContent}
        />
      }
      classes={{ root: classes.root }}
    >
      <LegalContent
        title={title}
        navigationTitle={navigationTitle}
        contents={contents}
        contentHeadings={contentHeadings}
        current={current}
        changeActiveContent={changeActiveContent}
        relatedContent={relatedContent}
      />
    </ContentPage>
  );
}

Legal.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    page: PropTypes.shape({
      title: PropTypes.string.isRequired,
      content_navigation: PropTypes.shape({
        value: PropTypes.shape({
          title: PropTypes.string.isRequired
        }).isRequired
      }).isRequired,
      body: PropTypes.arrayOf(
        PropTypes.shape({
          type: PropTypes.string,
          value: PropTypes.shape({})
        })
      ),
      active_content: PropTypes.string,
      related_content: PropTypes.shape({})
    }).isRequired
  }).isRequired
};

export default withStyles(styles)(Legal);
